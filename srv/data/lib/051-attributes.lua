ConfigAttributes = {
    storage = 32320232,
    maxAttrs = {
        pMagic = 15,
        pHit = 15,
        lifeLeech = 15,
        manaLeech = 15,
        lifeBonus = 40000
    }
}


function getAttrPoints(cid)
    if (getPlayerStorageValue(cid, ConfigAttributes.storage) < 0) then
       setPlayerStorageValue(cid, ConfigAttributes.storage, 0)
    end
    return getPlayerStorageValue(cid, ConfigAttributes.storage)
end

function setAttrPoints(cid, val)
    if (getPlayerStorageValue(cid, ConfigAttributes.storage) < 0) then
        setPlayerStorageValue(cid, ConfigAttributes.storage, 1)
    else
        setPlayerStorageValue(cid, ConfigAttributes.storage, getPlayerStorageValue(cid, ConfigAttributes.storage) + val)
    end
end