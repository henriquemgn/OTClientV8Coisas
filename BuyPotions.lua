
--buy 1000 mana potions

local npc = getCreatureByName("Rachel")

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

  NPC.say("hi trade")

  delay(1000)

  NPC.say("hi trade")

  delay(1000)

  return "retry"

end

delay(200)

--check supply

local itemID = 238

local minmpcount = 1000

local totalMp = 0

for _, container in pairs(getContainers()) do

  for _, item in ipairs(container:getItems()) do

    

    if (item:getId() == itemID) then

      

      totalMp = totalMp + item:getCount() 

    end

  end

end

info(totalMp)

if totalMp <= minmpcount then

  NPC.buy(238, 100)

  return "retry"

end

