ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local SpawnedVehicles = {}

RegisterServerEvent('mg_carstatus:addVehicle')
AddEventHandler('mg_carstatus:addVehicle', function(plate, entity)
    if Config.Debug then
        print("ADDED CAR | PLATE: "..plate.." ENTITY ID: "..entity)
    end
    table.insert(SpawnedVehicles, { plate = _Utils.Trim(plate), entity = entity })
end)

RegisterServerEvent('mg_carstatus:removeVehicle')
AddEventHandler('mg_carstatus:removeVehicle', function(plate, entity)
    for key, value in pairs(SpawnedVehicles) do
        if value.plate == _Utils.Trim(plate) then
            if Config.Debug then
                print("REMOVED CAR | PLATE: "..plate.." ENTITY ID: "..entity)
            end
            table.remove(SpawnedVehicles, key)
        end
    end
end)

ESX.RegisterServerCallback('mg_carstatus:getVehicleState', function(source, cb, plate)
    if Config.Debug then
        print("SEARCHING FOR CAR STATE: "..plate)
    end
    for key, value in pairs(SpawnedVehicles) do
        if value.plate == _Utils.Trim(plate) then
            if Config.Debug then
                print("FOUNDED CAR | PLATE: "..value.plate.." ENTITY ID: "..value.entity)
            end
            cb(true, value.entity)
        end
    end
    cb(false)
end)