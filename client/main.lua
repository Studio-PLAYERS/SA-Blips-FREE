local function createBlips()
    for SA, _ in pairs(Config.Locations) do
        if Config.Locations[SA]["showblip"] then
            local SABlip = AddBlipForCoord(Config.Locations[SA]["coords"]["x"], Config.Locations[SA]["coords"]["y"], Config.Locations[SA]["coords"]["z"])
            SetBlipSprite(SABlip, Config.Locations[SA]["blipsprite"])
            SetBlipScale(SABlip, Config.Locations[SA]["scale"])
            SetBlipDisplay(SABlip, 4)
            SetBlipColour(SABlip, Config.Locations[SA]["blipcolor"])
            SetBlipAsShortRange(SABlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Locations[SA]["label"])
            EndTextCommandSetBlipName(SABlip)
        end
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createBlips()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        createBlips()
    end
end)