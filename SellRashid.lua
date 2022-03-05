local npc = getCreatureByName("Rashid")

if not npc then 

  return false 

end

local pos = player:getPosition()

local npcPos = npc:getPosition()

if math.max(math.abs(pos.x - npcPos.x), math.abs(pos.y - npcPos.y)) > 3 then

  autoWalk(npcPos, {precision=3})

  delay(300)

  return "retry"

end

if not NPC.isTrading() then

  NPC.say("hi")

  delay(2000)
    NPC.say("trade")

  delay(2000)

  return "retry"

end

NPC.sellAll()

delay(1200)

return true
