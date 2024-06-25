-- Znote Shop v1.0 for Znote AAC on TFS 0.3.6+ Crying Damson.

function onSay(cid, words, param)
	local storage = 54073 -- Make sure to select non-used storage. This is used to prevent SQL load attacks.
	local cooldown = 15 -- in seconds.
	local base_outfit = 8000
	
	if getPlayerStorageValue(cid, storage) <= os.time() then
		setPlayerStorageValue(cid, storage, os.time() + cooldown)
		local accid = getAccountNumberByPlayerName(getCreatureName(cid))
		
		local type_desc = {
			"itemids",
			"pending premium (skip)",
			"pending gender change (skip)",
			"pending character name change (skip)",
			"Outfit",
			"Mounts"
		}
		print("Player: " .. getCreatureName(cid) .. " triggered !shop talkaction.")
		-- Create the query
		local orderQuery = db.storeQuery("SELECT `id`, `type`, `itemid`, `count` FROM `znote_shop_orders` WHERE `account_id` = " .. accid .. ";")
		local served = false 

		-- Detect if we got any results
		if orderQuery ~= false then
			repeat
				-- Fetch order values
				local q_id = result.getDataInt(orderQuery, "id")
				local q_type = result.getDataInt(orderQuery, "type")
				local q_itemid = result.getDataInt(orderQuery, "itemid")
				local q_count = result.getDataInt(orderQuery, "count")
				print("Processing type "..q_type..": ".. type_desc[q_type])
				-- ORDER TYPE 1 (Regular item shop products)
				if q_type == 1 then
					served = true
					-- Get wheight
					local playerCap = getPlayerFreeCap(cid)
					local itemweight = getItemWeightById(q_itemid, q_count)
						if playerCap >= itemweight and getTileInfo(getCreaturePosition(cid)).protection then
							--backpack check
							local backpack = getPlayerSlotItem(cid, 3)
							local gotItem = false
							if(backpack and backpack.itemid > 0) then
								local received = doAddContainerItem(getPlayerSlotItem(cid, 3).uid, q_itemid,q_count)
								if(received ~= false) then
								local desc = (getItemInfo(q_itemid).description ~= '' and ''..getItemInfo(q_itemid).description..'\n' or '')
								doItemSetAttribute(received, "description", ''..desc..'Purchased by '..getCreatureName(cid)..' \n['..os.date('%d/%m/%Y %X', os.time())..'] \n ID: ['..q_id..']')
								local file = "data/logs/Shop Donate.txt"
                                local text = io.open(file, "a+")
								text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).." ["..getPlayerLevel(cid).."]: Comprou 1 "..getItemNameById(q_itemid).." ID ["..q_id.."]\n")
								text:close()
									db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
									doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! You have recieved ".. q_count .." "..getItemNameById(q_itemid).."(s)!")
									gotItem = true
								end
							end

							if(not gotItem) then
								doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You have no available space in backpack to receive that item.")
							end						
						else
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Need more CAP and Need ProtectZone!")
						end			
				
	-- ORDER TYPE 5 (Outfits)
				elseif q_type == 5 then
					served = true
						if getPlayerVocation(cid) ~= q_count then
						-- db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
						doPlayerSendTextMessage(cid,19, "Your vocation is not compatible with this outfit.")
						elseif getCreatureStorage(cid, q_itemid) >= 1 then
						-- db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
                        doPlayerSendTextMessage(cid,19, "Your character already has this Outfit!!")
						else
						db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
						doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! You have received a new outfit!")
						doPlayerSendTextMessage(cid,19, "You have received >> Outfit << from our shop system.")
						setPlayerStorageValue(cid, q_itemid, 4)
						end														
				
				-- ORDER TYPE 6 (Mounts)
				elseif q_type == 6 then
					served = true
					-- Make sure player don't already have this outfit and addon
					if not getPlayerMount(cid, q_itemid) then -- Failed to find a proper hasMount 0.3 function?
						db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
						doPlayerAddMount(cid, q_itemid)
						doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! You have received a new mount!")
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You already have this mount!")
					end
				end
				
				-- Add custom order types here
				-- Type 1 is for itemids (Already coded here)
				-- Type 2 is for premium (Coded on web)
				-- Type 3 is for gender change (Coded on web)
				-- Type 4 is for character name change (Coded on web)
				-- Type 5 is for character outfit and addon (Already coded here)
				-- Type 6 is for mounts (Already coded here)
				-- So use type 7+ for custom stuff, like etc packages.
				-- if q_type == 7 then
				-- end
			until not result.next(orderQuery)
			result.free(orderQuery)
			if not served then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have no orders to process in-game.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have no orders.")
		end
		
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Can only be executed once every "..cooldown.." seconds. Remaining cooldown: ".. getPlayerStorageValue(cid, storage) - os.time())
	end
	return true
end