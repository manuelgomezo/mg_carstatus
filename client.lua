AddEventHandler("gameEventTriggered", function(name, args)
	if name == "CEventNetworkVehicleUndrivable" then
		local entity, destoyer, weapon = table.unpack(args)
		local plate = _Utils.Trim(GetVehicleNumberPlateText(entity))
		TriggerServerEvent('mg_carstatus:removeVehicle', plate, entity)
	end
end)