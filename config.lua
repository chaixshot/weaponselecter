Config= {}

Config.AllComponent = {
	{"barrel_heavy"},
	{"suppressor"},
	{"brake_precisionmuzzle"},
	{"clip_extended"},
	{"clip_box"},
	{"clip_drum"},
	{"compensator"},
	{"flashlight"},
	{"grip"},
	{"scope"},
	{"scope_advanced"},
	{"scope_mounted"},
	{"scope_small"},
	{"scope_zoom"},
	{"shells_default"},
}

Config.WeaponList = {
	["armor"] = {type = "tool", item = "armor", itemLabel = "Armor", price=1000},
	["defusekit"] = {type = "tool", item = "defusekit", itemLabel = "Defuse Kit", price=400},
	
	["weapon_smokegrenade"] = {type = "grenade", item = "weapon_smokegrenade", itemLabel = "Smoke Grenade", price=300},
	["weapon_flashbang"] = {type = "grenade", item = "weapon_flashbang", itemLabel = "Flashbang", price=200},
	
	["weapon_knife"] = {type = "melee", item = "weapon_knife", itemLabel = "Knife", price=0},
	["weapon_bat"] = {type = "melee", item = "weapon_bat", itemLabel = "Diamon Pickaxe", price=100},
	["weapon_battleaxe"] = {type = "melee", item = "weapon_battleaxe", itemLabel = "Green Lightsaber", price=100},
	["weapon_bottle"] = {type = "melee", item = "weapon_bottle", itemLabel = "Iron Sword", price=100},
	["weapon_crowbar"] = {type = "melee", item = "weapon_crowbar", itemLabel = "Long Iron PickAxe", price=100},
	["weapon_golfclub"] = {type = "melee", item = "weapon_golfclub", itemLabel = "Joker Flag", price=100},
	["weapon_hammer"] = {type = "melee", item = "weapon_hammer", itemLabel = "Mjolnir", price=100},
	["weapon_hatchet"] = {type = "melee", item = "weapon_hatchet", itemLabel = "Short Diamon PickAxe", price=100},
	["weapon_knuckle"] = {type = "melee", item = "weapon_knuckle", itemLabel = "Knuckle Dusters", price=100},
	["weapon_machete"] = {type = "melee", item = "weapon_machete", itemLabel = "Short Iron PickAxe", price=100},
	["weapon_poolcue"] = {type = "melee", item = "weapon_poolcue", itemLabel = "Pool Cue", price=100},
	["weapon_stone_hatchet"] = {type = "melee", item = "weapon_stone_hatchet", itemLabel = "Stone Hatchet", price=100},

	["weapon_appistol"] = {type = "pistol", item = "weapon_appistol", itemLabel = "AP Pistol", price=400},
	["weapon_ceramicpistol"] = {type = "pistol", item = "weapon_ceramicpistol", itemLabel = "Ceramic Pistol", price=300},
	["weapon_combatpistol"] = {type = "pistol", item = "weapon_combatpistol", itemLabel = "Combat Pistol", price=300},
	["weapon_doubleaction"] = {type = "pistol", item = "weapon_doubleaction", itemLabel = "Double Action Revolver", price=300},
	["weapon_heavypistol"] = {type = "pistol", item = "weapon_heavypistol", itemLabel = "Heavy Pistol", price=400},
	["weapon_revolver_mk2"] = {type = "pistol", item = "weapon_revolver_mk2", itemLabel = "Heavy Revolver Mk II", price=300},
	["weapon_marksmanpistol"] = {type = "pistol", item = "weapon_marksmanpistol", itemLabel = "Marksman Pistol", price=400},
	["weapon_navyrevolver"] = {type = "pistol", item = "weapon_navyrevolver", itemLabel = "Navy Revolver", price=400},
	["weapon_pistol_mk2"] = {type = "pistol", item = "weapon_pistol_mk2", itemLabel = "Pistol Mk II", price=300},
	["weapon_gadgetpistol"] = {type = "pistol", item = "weapon_gadgetpistol", itemLabel = "Perico Pistol", price=1000},
	["weapon_pistol50"] = {type = "pistol", item = "weapon_pistol50", itemLabel = "Pistol .50", price=300},
	["weapon_snspistol_mk2"] = {type = "pistol", item = "weapon_snspistol_mk2", itemLabel = "SNS Pistol Mk II", price=300},

	["weapon_assaultsmg"] = {type = "submachine", item = "weapon_assaultsmg", itemLabel = "Assault SMG", price=1100},
	["weapon_combatpdw"] = {type = "submachine", item = "weapon_combatpdw", itemLabel = "Combat PDW", price=1100},
	["weapon_combatmg_mk2"] = {type = "submachine", item = "weapon_combatmg_mk2", itemLabel = "Combat MG Mk II", price=1500},
	["weapon_gusenberg"] = {type = "submachine", item = "weapon_gusenberg", itemLabel = "Gusenberg Sweeper", price=1100},
	["weapon_microsmg"] = {type = "submachine", item = "weapon_microsmg", itemLabel = "Micro SMG", price=1100},
	["weapon_machinepistol"] = {type = "submachine", item = "weapon_machinepistol", itemLabel = "Machine Pistol", price=1100},
	["weapon_minismg"] = {type = "submachine", item = "weapon_minismg", itemLabel = "Mini SMG", price=1100},
	["weapon_mg"] = {type = "submachine", item = "weapon_mg", itemLabel = "MG", price=1100},
	["weapon_smg_mk2"] = {type = "submachine", item = "weapon_smg_mk2", itemLabel = "SMG Mk II", price=1500},

	["weapon_assaultshotgun"] = {type = "shotgun", item = "weapon_assaultshotgun", itemLabel = "Assault Shotgun", price=1200},
	["weapon_bullpupshotgun"] = {type = "shotgun", item = "weapon_bullpupshotgun", itemLabel = "Bullpup Shotgun", price=900},
	["weapon_combatshotgun"] = {type = "shotgun", item = "weapon_combatshotgun", itemLabel = "Combat Shotgun", price=1200},
	["weapon_dbshotgun"] = {type = "shotgun", item = "weapon_dbshotgun", itemLabel = "Double Barrel Shotgun", price=900},
	["weapon_heavyshotgun"] = {type = "shotgun", item = "weapon_heavyshotgun", itemLabel = "Heavy Shotgun", price=1200},
	["weapon_musket"] = {type = "shotgun", item = "weapon_musket", itemLabel = "Musket", price=1500},
	["weapon_pumpshotgun"] = {type = "shotgun", item = "weapon_pumpshotgun", itemLabel = "Pump Shotgun", price=900},
	["weapon_pumpshotgun_mk2"] = {type = "shotgun", item = "weapon_pumpshotgun_mk2", itemLabel = "Pump Shotgun Mk II", price=900},
	["weapon_sawnoffshotgun"] = {type = "shotgun", item = "weapon_sawnoffshotgun", itemLabel = "Sawed-Off Shotgun", price=900},
	["weapon_autoshotgun"] = {type = "shotgun", item = "weapon_autoshotgun", itemLabel = "Sweeper Shotgun", price=900},

	["weapon_advancedrifle"] = {type = "assault", item = "weapon_advancedrifle", itemLabel = "Advanced Rifle", price=3000},
	["weapon_assaultrifle"] = {type = "assault", item = "weapon_assaultrifle", itemLabel = "Assault Rifle", price=3000},
	["weapon_assaultrifle_mk2"] = {type = "assault", item = "weapon_assaultrifle_mk2", itemLabel = "Assault Rifle Mk II", price=3200},
	["weapon_bullpuprifle"] = {type = "assault", item = "weapon_bullpuprifle", itemLabel = "Bullpup Rifle", price=3000},
	["weapon_bullpuprifle_mk2"] = {type = "assault", item = "weapon_bullpuprifle_mk2", itemLabel = "Bullpup Rifle Mk II", price=3200},
	["weapon_carbinerifle"] = {type = "assault", item = "weapon_carbinerifle", itemLabel = "Carbine Rifle", price=3000},
	["weapon_carbinerifle_mk2"] = {type = "assault", item = "weapon_carbinerifle_mk2", itemLabel = "Carbine Rifle Mk II", price=3200},
	["weapon_compactrifle"] = {type = "assault", item = "weapon_compactrifle", itemLabel = "Compact Rifle", price=3000},
	["weapon_militaryrifle"] = {type = "assault", item = "weapon_militaryrifle", itemLabel = "Military Rifle", price=3200},
	["weapon_specialcarbine"] = {type = "assault", item = "weapon_specialcarbine", itemLabel = "Special Carbine", price=3000},
	["weapon_specialcarbine_mk2"] = {type = "assault", item = "weapon_specialcarbine_mk2", itemLabel = "Special Carbine Mk II", price=3000},

	["weapon_heavysniper_mk2"] = {type = "sniper", item = "weapon_heavysniper_mk2", itemLabel = "Heavy Sniper Mk II", price=4000},
	["weapon_marksmanrifle_mk2"] = {type = "sniper", item = "weapon_marksmanrifle_mk2", itemLabel = "Marksman Rifle Mk II", price=4500},
}

Config.ammo = 0
Config.infinite = false
Config.clip = false
Config.disablecontrol = false
Config.removeweapon = {}