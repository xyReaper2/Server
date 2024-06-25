local config = {
health = 10*2157,
}


function onCastSpell(cid, var)

if getCreatureMaster(cid) then
local master = getCreatureMaster(cid)
	if isInParty(master) then
		local members = getPartyMembers(getPlayerParty(master))
		local health = math.ceil( config.health / #members )
		-- local mana = math.ceil( config.mana / #members )
		for i = 1, #members do
		doCreatureAddHealth(members[i], health)
		doSendAnimatedText(getCreaturePosition(members[i]), "+"..health, 18)	
		doSendMagicEffect(getCreaturePosition(members[i]), 5)		
		end
	else
		doCreatureAddHealth(master, config.health)
		doSendAnimatedText(getCreaturePosition(master), "+"..config.health, 18)		
		doSendMagicEffect(getCreaturePosition(master), 5)	
	end

	end

return true
end