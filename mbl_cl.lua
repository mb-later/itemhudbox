RequireTable = {}

RegisterNetEvent("ItemInfo")
AddEventHandler("ItemInfo",function(hotType, itemName, itemLabel, itemCount)
    SendNUIMessage({
        action = true,
        type = hotType or "added",
        name = itemName or "Itemname",
        count = tonumber(itemCount) or 1,
        label = itemLabel or "Itemname"
    })
end)


RegisterCommand("add",function()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
    TriggerEvent("addtoReq", coords, "weapon_pistol", "Pistol", 1)
end)

RegisterNetEvent("removeFromReq",function(coords, itemName)
    for k in pairs(RequireTable) do
        if RequireTable[k].coords == coords and RequireTable[k].itemName == itemName then
            table.remove(RequireTable,k)
        end
    end
end)

RegisterNetEvent("addtoReq",function(coords, itemName, itemLabel, itemCount)
    table.insert(RequireTable, {
        coords = coords,
        itemName = itemName,
        itemLabel = itemLabel,
        itemCount = itemCount,
        show = false
    })
end)

Citizen.CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        local entityCoords = GetEntityCoords(ped)
        for key,value in pairs(RequireTable) do
            if #(entityCoords - value.coords) < 3 then
                if not value.show then
                    value.show = true
                    SendNUIMessage({
                        action = true,
                        type = "require",
                        name = value.itemName or "Itemname",
                        count = tonumber(value.itemCount) or 1,
                        label = value.itemLabel or "Itemname"
                    })
                end
            end
            if #(entityCoords - value.coords) > 3 then
                value.show = false
                SendNUIMessage({
                    action = false
                })
            end
        end
        Wait(500)
    end
end)