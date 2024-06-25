function getPlayerNameByGUID2(n)
local c = db.getResult("SELECT `name` FROM `players` WHERE `id` = "..n..";")
if (c:getID() == -1) then
return "SQL_ERROR["..n.."]"
end
return c:getDataString("name")
end
 
function onSay(cid, words, param)
local max = 20
local letters_to_next = 20
 
local skills = {
['fist'] = 0,
['club'] = 1,
['sword'] = 2,
['axe'] = 3,
['distance'] = 4,
['shielding'] = 5,
['fishing'] = 6,
['dist'] = 4,
['shield'] = 5,
['fish'] = 6,
}
local name = "                 Highscores\n\n"
local name_now
local rkn = 0
local no_break = 0
param = string.lower(param)
dofile('config.lua')
if param == "" or param == "level" or skills[param] == nil and (not(param == "magic" or param == "ml" or param == "reset" or param == "resets"))then
name = name.." * * * * * * Rank Level * * * * * *\n"
name = name.."\n"
local v = db.getResult("SELECT `name`, `level`, `experience` FROM `players` WHERE `group_id` <= 2 ORDER BY `experience` DESC LIMIT 0,"..(max)..";")
repeat
no_break = no_break +1
if v:getID() == -1 then
break
end
rkn = rkn+1
name_now, l = v:getDataString("name"), string.len(v:getDataString("name"))
space = ""
for i=1, letters_to_next-l do
space = space.." "
end
name = name.."[ "..rkn.." ]   "..v:getDataInt("level") .." - "..name_now..space.." ".."\n"
if no_break >= 20 then
break
end
until v:next() == false
 
elseif param == "magic" or param == "ml" then
name = name.." * * * * * * Rank Magic * * * * * *\n"
name = name.."\n"
local v = db.getResult("SELECT `name`, `level`, `maglevel` FROM `players` WHERE `group_id` <= 2 ORDER BY `maglevel` DESC LIMIT 0,"..(max)..";")
repeat
if v:getID() == -1 then
break
end
rkn = rkn+1
name_now, l = v:getDataString("name"), string.len(v:getDataString("name"))
space = ""
for i=1, letters_to_next-l do
space = space.." "
end
name = name.."[ "..rkn.." ]   "..v:getDataInt("maglevel").." - "..name_now..space.." ".." ".."".."\n"
until v:next() == false
 ----------------------
 
 

elseif param == "reset" or param == "resets" then
name = name.." * * * * * * Rank Resets * * * * * *\n"
name = name.."\n"
local v = db.getResult("SELECT `name`, `resets` FROM `players` WHERE `resets` is not null AND `group_id` <= 3 ORDER BY `resets` DESC LIMIT 0,"..(max)..";")
repeat
if v:getID() == -1 then
break
end
rkn = rkn+1
name_now, l = v:getDataString("name"), string.len(v:getDataString("name"))
space = ""
for i=1, letters_to_next-l do
space = space.." "
end
name = name.."[ "..rkn.." ]   "..v:getDataInt("resets").." - "..name_now..space.." ".." ".."".."\n"
until v:next() == false
 ---------------------
elseif skills[param] ~= nil then
name = name.." * * * * * * Rank "..param.." * * * * * *\n"
name = name.."\n"
local v = db.getResult("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = "..skills[param].." ORDER BY `value` DESC;")
local kk = 0
 
repeat
if kk == max or v:getID() == -1 then
break
end
kk = kk+1
name_now, l = getPlayerNameByGUID2(v:getDataInt("player_id")), string.len(getPlayerNameByGUID2(v:getDataInt("player_id")))
space = ""
for i=1, letters_to_next-l do
space = space.." "
end
 
if name_now == nil then
name_now = 'sql error['..v:getDataInt("player_id")..']'
end
name = name.."[ "..kk.." ]   "..v:getDataInt("value").." - "..name_now..space.." \n"
until v:next() == false
end
if name ~= "                 Highscores\n\n" then
doPlayerPopupFYI(cid, name)
end
 
return true
end