QBCore = exports["qb-core"]:GetCoreObject()

local PlayerData = {}
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)


-- Code
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(8)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        local sleep = 2000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,v in pairs(Config.Aile) do
            for _, y in pairs(v.Stash) do
                local distance = #(coords - vector3(y.coords.x, y.coords.y, y.coords.z))
                if distance <= 6.0 then
                    sleep = 1
                    text = y.text
                    if distance <= 1.5 then
                        text = "[E] " ..text
                        if IsControlJustPressed(0, 46) then
                            OpenStash(_, v) 
                        end
                    end
                    DrawText3D(y.coords.x, y.coords.y, y.coords.z, text)
                    DrawMarker(20, y.coords.x, y.coords.y, y.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.35, 0.5, 0.15, 255, 0, 0, 91, false, false, false, 1, false, false, false)
                end
            end 
        end
        Wait(sleep)
    end
end)

OpenStash = function(k, v)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "STDEPO"..QBCore.Functions.GetPlayerData().citizenid, {maxweight = 1000000,slots = 50,})
    TriggerEvent("inventory:client:SetCurrentStash", "STDEPO"..QBCore.Functions.GetPlayerData().citizenid)
end






