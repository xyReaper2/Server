function onSay(cid, words, param)
doSendPlayerExtendedOpcode(cid, 170,  "1;"..getCreatureName(cid).."")
    return true
end