function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 205
if getVocationInfo(getPlayerVocation(cid)).name == "Senjuu Tobirama" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Senjuu Tobirama!")
else
doPlayerSetVocation(cid, 250)
doCreatureSay(cid, "Senjuu Tobirama Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 205)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 468})
doRemoveItem(item.uid)
end
return true
end

