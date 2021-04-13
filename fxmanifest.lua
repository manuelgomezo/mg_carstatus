fx_version 'adamant'

game 'gta5'

description 'ESX JB Eden Garage'

dependencies {
	'es_extended',
	'ft_libs'
}

server_scripts {
	'_utils.lua',
	'config.lua',
	'server.lua',
}

client_scripts {
	'_utils.lua',
	'config.lua',
	'functions.lua',
	'client.lua',
}

exports {
	'GetVehicleProperties',
	'SetVehicleProperties',
}
