local ranks = {

['fist'] = {0},
['hand'] = {0},
['taijutsu'] = {0},
['glove'] = {1},
['sword'] = {2},
['axe'] = {3},
['distance'] = {4},
['defense'] = {5},
['shield'] = {5},
['torneio'] = {6},
['ninjutsu'] = {7},
['magic'] = {7},
['ml'] = {7},
['magic level'] = {7},
['level'] = {8},

}


function onSay(cid, words, param)

local msg = string.lower(param)
if ranks[msg] ~= nil then
str = getHighscoreString((ranks[msg][1]))
else
str = getHighscoreString((8))
end
doShowTextDialog(cid,6500, str)
return true
end