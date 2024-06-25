local baus = {
   [4092] = {
      recompense_list = {13893, 19431},
      count = {500, 25},
      surprise_items = {
         { itemId = 19436, itemCount = 25, chance = 50 },
         { itemId = 19437, itemCount = 25, chance = 50 },
         { itemId = 19450, itemCount = 25, chance = 50 },
         { itemId = 19449, itemCount = 25, chance = 50 },
         { itemId = 19452, itemCount = 25, chance = 50 }
      }
   }
}

function doAddSurpriseItem(cid, itemId, itemCount)
	if isCreature(cid) then
	   doPlayerAddItem(cid, itemId, itemCount)
	   doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Parabéns, você recebeu ".. itemCount .." ".. getItemNameById(itemId) .. " como item surpresa!")
	   doSendMagicEffect(getThingPos(cid), EFFECT_FIREWORK_YELLOW)
   end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
   local bau = baus[item.actionid]
   if not bau then
      print("Bau com a actionID: " .. item.actionid .. " nao registrado.")
      return true
   end

   for i = 1, #bau.recompense_list do
      doPlayerAddItem(cid, bau.recompense_list[i], bau.count[i])
   end

   for i = 1, #bau.surprise_items do
      local itemData = bau.surprise_items[i]
      if math.random(100) <= itemData.chance then
         doAddSurpriseItem(cid, itemData.itemId, itemData.itemCount)
      end
   end

   doPlayerSendTextMessage(cid, 25, "Completado! Você completou a dungeon com sucesso.")
   setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
   setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
   setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Akatsuki")
   setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
   setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
   doPlayerSave(cid)
   doPlayerAddEloPoints(cid, 5)
   doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")
   doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

   return true
end