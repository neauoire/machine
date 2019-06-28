local Operator = { senders = {}, bangs = {}, midi = {} }

local OCTAVE = { 'C','C#','D','D#','E','F','F#','G','G#','A','A#','B' }
local MAJORS = { 'C','D','E','F','G','A','B' }

-- Utils

local pos_at = function(id)
  return { x = math.floor(id % 16), y = math.floor(id/16)+1  }
end

local limit = function(val,length)
  return ((val-1) % length)+1
end

local clamp = function(val,min,max)
  return val < min and min or val > max and max or val
end

local index_of = function(list,value)
  for i=1,#list do
    if list[i] == value then return i end
  end
  return -1
end

local note_to_num = function(note)
  return index_of(OCTAVE,note)-1
end

local num_to_note = function(num)
  if num == 16 then return 'RAND' end -- RAND
  return OCTAVE[((num-1) % 12)+1]
end


local midi_to_hz = function(note)
  return (440/32) * (2 ^ ((note - 9) / 12))
end

local bin_to_num = function(bin)
  local bin = string.reverse(bin)
  local sum = 0
  for i = 1, string.len(bin) do
    num = string.sub(bin, i,i) == "1" and 1 or 0
    sum = sum + num * math.pow(2, i-1)
  end
  return math.floor(sum)
end

local num_to_bin = function(num,length)
  local length = length or 8
  local t = {}
  for b=length,1,-1 do
    rest = math.fmod(num,2)
    t[b] = math.floor(rest)
    num = (num-rest)/2
  end
  return table.concat(t)
end

-- Begin

Operator.init = function(self)
  self.midi_signal = midi.connect(1)
end

Operator.bind = function(self,navi,stack,instructor)
  self.navi = navi
  self.stack = stack
  self.instructor = instructor
end

Operator.reset = function(self)
  self.bangs = {}
  self.senders = {}
  for id=1,128 do
     -- = false
  end
end

Operator.run_instruction = function(self,instruction,res)
  if Operator[instruction.cmd] ~= nil then
    Operator[instruction.cmd](self,instruction.key,instruction.val,res)
  else
    print('Unknown CMD:'..cmd)
  end
end

Operator.run_card = function(self,id,instructions)
  -- Defaults
  res = { id = id, OCT = 5, VEL = 16, STEP = self.navi:get_step(), FRAME = self.navi:get_step(), BANG = self.navi:get_bangs(id) }

  for id=1,#instructions do
    local i = instructions[id].inst
    res.line = instructions[id].line
    if i > 0 then
      local instruction = self.instructor:get(i)
      self:run_instruction(instruction,res)
    end
  end
end

Operator.run_cards = function(self,cards)
  for i=1,#cards do
    local id = cards[i]
    local instructions = self.stack:get_instructions(id)
    self:run_card(id,instructions)
  end  
end

Operator.run = function(self)
  self:reset()
  self:release_midi()
  self:run_cards(self.stack:get_cards())
  self:send_midi()
end

Operator.special_mod = function(self,origin,mod)
  if (mod..''):match('M') then
    local real_mod = tonumber(mod:sub(1,#mod-1))
    local origin_note = num_to_note(origin+1)
    local origin_major = origin_note:sub(1,1)
    local origin_index = index_of(MAJORS,origin_major)
    local mod_key = ((origin_index + real_mod - 1) % #MAJORS)+1

    return index_of(OCTAVE,MAJORS[mod_key])
  else
    return ((origin+tonumber(mod)-1)%16)+1
  end
  return 0
end

Operator.IF = function(self,key,val,res)
  res.skip = false
  if key == 'STEP' then
    if tonumber(val) ~= limit(res.STEP,tonumber(val)) then res.skip = true end
  elseif key == 'NOTE' then
    if tonumber(res[key]) ~= note_to_num(val) then res.skip = true end
  elseif key == 'BANG' then
    if res.BANG[tonumber(val)] ~= true then res.skip = true end
  else 
    if tonumber(res[key]) ~= tonumber(val) then res.skip = true end
  end
end

Operator.SET = function(self,key,val,res)
  if res.skip == true then return end
  if key == 'NOTE' then
    res.NOTE = math.floor(note_to_num(val))
  else
    res[key] = val
  end
  res.LAST = key
end

Operator.SEND = function(self,key,val,res)
  if res.skip == true then return end
  if key == 'CHAN' then
    if res.NOTE == nil then return end
    local value = res.NOTE+(res.OCT*12)
    local velocity = math.floor((tonumber(res.VEL)/16)*127)
    self.senders[res.id] = true
    self:insert_midi(value,velocity,val)
  elseif key == 'OSC' then
    self.senders[res.id] = true
  elseif key == 'BANG' then
    self.senders[res.id] = true
    self.bangs[res.id] = val
  elseif key == 'SYS' then
    self.senders[res.id] = true
  end
  print('SEND: '..key..': '..val)
end

Operator.DO = function(self,key,val,res)
  if res.skip == true then return end
  local next_line_val = self.stack:get_line_val(res.id,res.line+1)
  local origin = bin_to_num(next_line_val)
  local mod = 0
  if key == 'INCR' then
    mod = val
  elseif key == 'DECR' then
    mod = '-'..val
  elseif key == 'RAND' then
    mod = -origin+(math.random(tonumber(val)))
  end
  local next_line_num = self:special_mod(origin,mod)
  local next_line_bin = num_to_bin(next_line_num,4)
  self.stack:set_line_val(res.id,res.line+1,next_line_bin)
end

-- Midi

Operator.duplicated_midi = function(self,note,channel)
  for id=1,#self.midi do
    if self.midi[id].note == note and self.midi[id].channel == channel then
      return true
    end
  end
  return false
end

Operator.insert_midi = function(self,note,velocity,channel)
  if self:duplicated_midi(note,channel) then
    return
  end
  table.insert(self.midi,{note = clamp(note,0,127),velocity = velocity,channel = channel})
end

Operator.release_midi = function(self)
  while #self.midi > 0 do
    self.midi_signal:note_off(self.midi[1].note,self.midi[1].velocity,self.midi[1].channel)
    table.remove(self.midi)
  end
end

Operator.send_midi = function(self)
  for id=1,#self.midi do
    self.midi_signal:note_on(self.midi[id].note,self.midi[id].velocity,self.midi[id].channel)
  end
end

return Operator