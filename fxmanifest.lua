fx_version 'cerulean'
lua54 'yes'
game 'gta5'
-- use_fxv2_oal 'yes'

client_scripts {
	'config.lua',
	'client/function.lua',
	'client/quickslot.lua',
	'client/weapon.lua',
}

files {
    "html/*.*",
    "html/sounds/*.*",
    "html/css/*.*",
    "html/js/*.*",
    "html/img/items/*.*",
}

ui_page "html/index.html"

escrow_ignore {
	"config.lua",
}