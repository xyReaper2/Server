function onUse(cid, item, frompos, item2, topos)
local config={
dias="1"
}
doPlayerAddPremiumDays(cid, config.dias)
doPlayerSendTextMessage(cid,22,"Parab�ns! Voc� Ganhou 1 Dias de Premium Account! :)")
doRemoveItem(item.uid,1) 
return true
end