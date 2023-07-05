ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(250)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(250)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleModel = GetEntityModel(vehicle)

        if ESX and ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name ~= "police" and ESX.PlayerData.job.name ~= "ambulance" then
            if IsModelInTable(vehicleModel, Config.CopCars) or IsModelInTable(vehicleModel, Config.AmbulanceCars) then
                ESX.ShowNotification(Locales[Config.Locale]['warning'])
                Citizen.Wait(Config.Wait)
                TaskLeaveVehicle(playerPed, vehicle, 1)
            end
        end
    end
end)

function IsModelInTable(model, modelTable)
    for i = 1, #modelTable do
        if model == modelTable[i] then
            return true
        end
    end
    return false
end