	function onUse(cid, item, frompos, item2, topos)

tile_x = 365
tile_y = 491
tile_z = 7

cTem_x = 365
cTem_y = 494
cTem_z = 7

msg = "Agora voc� � um morador dessa cidade!!!"

templeP = {x=cTem_x, y=cTem_y, z=cTem_z}
tileP = {x=tile_x, y=tile_y, z=tile_z}
pPos = getPlayerPosition(cid)

  check = checkPos(tileP, pPos)
  if check == 1 then
     doPlayerSetMasterPos(cid, templeP)
     checkSw(item)
     doTeleportThing(cid, templeP)
     doSendMagicEffect(templeP, 10)
     doPlayerSendTextMessage(cid, 20, msg)
  else
     doPlayerSendCancel(cid, "Fique em frente da estatua!")
  end

return 1
end

function checkPos(tileP, pPos)
  if tileP.x == pPos.x and tileP.y == pPos.y then
     return 1
  else
     return 0
  end
end

function checkSw(item)
  if item.itemid == 2711 then
     doTransformItem(item.uid, 2712)
  elseif item.itemid == 2712 then
     doTransformItem(item.uid, 2711)
  end
end