
local itemID = 238 -- ID da Great Mana Potion

local minmpcount = 100 -- Minimo de quantidade de potions

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

  gotoLabel("refill") -- vai para label do cavebot refill se estiver com menos potions que o minimo

  return true

end

gotoLabel("hunt") -- caso o contrario volta para o label hunt

return true
