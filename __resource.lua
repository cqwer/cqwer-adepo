
server_script '@DoxAC/server_safety/values.lua'
 

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Script Made By Cqwer'

client_scripts {
	'config.lua',
	'client/main.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua',
}