local items = {
  {aid = 70011, item = 15781}
}

local function itemSelect(actionId)
  for _, itemData in pairs(items) do
    if itemData.aid == actionId then
      return itemData.item
    end
  end
  return 15781
end

function onUse(cid, item, frompos, item2, topos)
  if getPlayerStorageValue(cid, 631232) < 1 then
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Are Receiving An Necklace!")
    local itemId = itemSelect(item.actionid)
    local item = doPlayerAddItem(cid, itemId, 1)
    doItemSetAttribute(item, "owner", getPlayerGUID(cid))
    setPlayerStorageValue(cid, 631232, 1)
    doItemSetAttribute(item, "description", "" .. getItemInfo(itemId).description .. "\nOwner : " .. getCreatureName(cid) .. "")
  else
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already received an item.")
    -- doTeleportThing(cid,{x = 3467, y = 3497, z = 5})
  end
  return true
end