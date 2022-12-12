local function GetIntFromBlob(b, s, o)
	r = 0
	for i=1,s,1 do
		r = r | (string.byte(b,o+i)<<(i-1)*8)
	end
	return r
end

local function GetStringFromBlob(b, s, o)
	r = ''
	for i=1,s,1 do
		if string.byte(b,o+i) ~= 0 then
			r = r .. string.char(string.byte(b,o+i))
		else
			break
		end
	end
	return r
end

GetWeaponComponentHudStats = function(componentHash)
	local blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	local retval = Citizen.InvokeNative(0xB3CAF387AE12E9F8, componentHash, blob, Citizen.ReturnResultAnyway())
	local hudDamage = GetIntFromBlob(blob,8,0)
	local hudSpeed = GetIntFromBlob(blob,8,8)
	local hudCapacity = GetIntFromBlob(blob,8,16)
	local hudAccuracy = GetIntFromBlob(blob,8,24)
	local hudRange = GetIntFromBlob(blob,8,32)
	return retval, hudDamage, hudSpeed, hudCapacity, hudAccuracy, hudRange
end

GetWeaponHudStats = function(weaponHash)
	local playerPed = PlayerPedId()
	local blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	local retval = Citizen.InvokeNative(0xD92C739EE34C9EBA, weaponHash, blob, Citizen.ReturnResultAnyway())
	local hudDamage = GetIntFromBlob(blob,8,0)
	local hudSpeed = GetIntFromBlob(blob,8,8)
	local hudCapacity = GetIntFromBlob(blob,8,16)
	local hudAccuracy = GetIntFromBlob(blob,8,24)
	local hudRange = GetIntFromBlob(blob,8,32)
	
	local hudDamage2
	local hudAccuracy2
	if HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_01")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_02")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_02")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_03")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_03")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_04")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_04")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_05")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_05")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_06")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_06")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_07")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_07")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_08")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_08")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_MUZZLE_09")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_09")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_AR_SUPP")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_AR_SUPP_02")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_PI_SUPP")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_PI_SUPP_02")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_SR_SUPP")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_AT_SR_SUPP_03")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_CERAMICPISTOL_SUPP")) then
		hudAccuracy2 = GetHashKey("COMPONENT_AT_MUZZLE_01")
	end
	if HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE")) then
		hudDamage2 = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT")) then
		hudDamage2 = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01")) then
		hudDamage2 = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT")) then
		hudDamage2 = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT")) then
		hudDamage2 = GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT")) then
		hudDamage2 = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING")) then
		hudDamage2 = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ")) then
		hudDamage2 = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY")) then
		hudDamage2 = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY")
	elseif HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER")) then
		hudDamage2 = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER")
	end
	if hudDamage2 then
		local _,hudDamage2,_,_,_ = GetWeaponComponentHudStats(hudDamage2)
		hudDamage = hudDamage+hudDamage2
	end
	if hudAccuracy2 then
		local _,_,_,_,hudAccuracy2 = GetWeaponComponentHudStats(hudAccuracy2)
		hudAccuracy = hudAccuracy+hudAccuracy2
	end
				
	return retval, hudDamage, hudSpeed, hudCapacity, hudAccuracy, hudRange
end

local WeaponsList = {
	{
		name = "WEAPON_PISTOL",
		label = ("pistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_PISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_PISTOL_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_COMBATPISTOL",
		label = ("combatpistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_APPISTOL",
		label = ("appistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_APPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_APPISTOL_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_PISTOL50",
		label = ("pistol50"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_PISTOL50_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_PISTOL50_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_REVOLVER",
		label = ("revolver"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_REVOLVER_CLIP_01")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_REVOLVER_VARMOD_BOSS")},
		}
	},

	{
		name = "WEAPON_SNSPISTOL",
		label = ("snspistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SNSPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_SNSPISTOL_CLIP_02")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_SNSPISTOL_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_HEAVYPISTOL",
		label = ("heavypistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_REVOLVER_MK2",
		label = ("revolver_mk2"),
		components = {
			{ name = "rounds_default", label = ("component_rounds_default"), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_hollowpoint", label = ("component_rounds_hollowpoint"), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "compensator", label = ("component_compensator"), hash = GetHashKey("COMPONENT_AT_PI_COMP_03")},
		}
	},

	{
		name = "WEAPON_SNSPISTOL_MK2",
		label = ("snspistol_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_hollowpoint", label = ("component_rounds_hollowpoint"), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH_03")},
			{ name = "scope_mounted", label = ("component_scope_mounted"), hash = GetHashKey("COMPONENT_AT_PI_RAIL_02")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{ name = "compensator", label = ("component_compensator"), hash = GetHashKey("COMPONENT_AT_PI_COMP_02")},
		}
	},

	{
		name = "WEAPON_PISTOL_MK2",
		label = ("pistol_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_hollowpoint", label = ("component_rounds_hollowpoint"), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ")},
			{ name = "scope_mounted", label = ("component_scope_mounted"), hash = GetHashKey("COMPONENT_AT_PI_RAIL")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH_02")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{ name = "compensator", label = ("component_compensator"), hash = GetHashKey("COMPONENT_AT_PI_COMP")},
		}
	},

	{
		name = "WEAPON_VINTAGEPISTOL",
		label = ("vintagepistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
		}
	},

	{
		name = "WEAPON_CERAMICPISTOL",
		label = ("ceramicpistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_CERAMICPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_CERAMICPISTOL_CLIP_02")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_CERAMICPISTOL_SUPP")},
		}
	},

	{
		name = "WEAPON_MICROSMG",
		label = ("microsmg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MICROSMG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MICROSMG_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_SMG",
		label = ("smg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SMG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_SMG_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_SMG_CLIP_03")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_SMG_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_ASSAULTSMG",
		label = ("assaultsmg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_MINISMG",
		label = ("minismg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MINISMG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MINISMG_CLIP_02")},
		}
	},

	{
		name = "WEAPON_SMG_MK2",
		label = ("smg_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_hollowpoint", label = ("component_rounds_hollowpoint"), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS_SMG")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2")},
			{ name = "scope_medium", label = ("component_scope_medium"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_SB_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_SB_BARREL_02")},
		}
	},

	{
		name = "WEAPON_MACHINEPISTOL",
		label = ("machinepistol"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
		}
	},

	{
		name = "WEAPON_COMBATPDW",
		label = ("combatpdw"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_03")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
		}
	},

	{
		name = "WEAPON_PUMPSHOTGUN",
		label = ("pumpshotgun"),
		components = {
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_SR_SUPP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_SAWNOFFSHOTGUN",
		label = ("sawnoffshotgun"),
		components = {
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_ASSAULTSHOTGUN",
		label = ("assaultshotgun"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
		}
	},

	{
		name = "WEAPON_BULLPUPSHOTGUN",
		label = ("bullpupshotgun"),
		components = {
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
		}
	},

	{
		name = "WEAPON_PUMPSHOTGUN_MK2",
		label = ("pumpshotgun_mk2"),
		components = {
			{ name = "shells_default", label = ("component_shells_default"), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_01")},
			{ name = "shells_dragonsbreath", label = ("component_shells_dragonsbreath"), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY")},
			{ name = "shells_steelbuckshot", label = ("component_shells_steelbuckshot"), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING")},
			{ name = "shells_flechette", label = ("component_shells_flechette"), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT")},
			{ name = "slugs_explosive", label = ("component_slugs_explosive"), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{ name = "scope_medium", label = ("component_scope_medium"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_SR_SUPP_03")},
			{ name = "brake_squaredmuzzle ", label = ("component_brake_squaredmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_08")},
		}
	},

	{
		name = "WEAPON_HEAVYSHOTGUN",
		label = ("heavyshotgun"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
		}
	},

	{
		name = "WEAPON_ASSAULTRIFLE",
		label = ("assaultrifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_03")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_CARBINERIFLE",
		label = ("carbinerifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02")},
			{ name = "clip_box", label = ("component_clip_box"), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_03")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_ADVANCEDRIFLE",
		label = ("advancedrifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_SPECIALCARBINE",
		label = ("specialcarbine"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_03")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_BULLPUPRIFLE",
		label = ("bullpuprifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_VARMOD_LOW")},
		}
	},

	{
		name = "WEAPON_BULLPUPRIFLE_MK2",
		label = ("bullpuprifle_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_MK2")},
			{ name = "scope_medium", label = ("component_scope_medium"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_BP_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_BP_BARREL_02")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
		}
	},

	{
		name = "WEAPON_SPECIALCARBINE_MK2",
		label = ("specialcarbine_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{ name = "scope_large", label = ("component_scope_large"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_SC_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_SC_BARREL_02")},
		}
	},

	{
		name = "WEAPON_ASSAULTRIFLE_MK2",
		label = ("assaultrifle_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{ name = "scope_large", label = ("component_scope_large"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_AR_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_AR_BARREL_02")},
		}
	},

	{
		name = "WEAPON_CARBINERIFLE_MK2",
		label = ("carbinerifle_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_small", label = ("component_scope_small"), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{ name = "scope_large", label = ("component_scope_large"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_CR_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_CR_BARREL_02")},
		}
	},

	{
		name = "WEAPON_COMPACTRIFLE",
		label = ("compactrifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02")},
			{ name = "clip_drum", label = ("component_clip_drum"), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_03")},
		}
	},

	{
		name = "WEAPON_MG",
		label = ("mg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MG_CLIP_02")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_02")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_MG_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_COMBATMG",
		label = ("combatmg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_COMBATMG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_COMBATMG_CLIP_02")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_COMBATMG_VARMOD_LOWRIDER")},
		}
	},

	{
		name = "WEAPON_COMBATMG_MK2",
		label = ("combatmg_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_medium", label = ("component_scope_medium"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{ name = "scope_large", label = ("component_scope_large"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_MG_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_MG_BARREL_02")},
		}
	},

	{
		name = "WEAPON_GUSENBERG",
		label = ("gusenberg"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_GUSENBERG_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_GUSENBERG_CLIP_02")},
		}
	},

	{
		name = "WEAPON_SNIPERRIFLE",
		label = ("sniperrifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_SNIPERRIFLE_CLIP_01")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE")},
			{ name = "scope_advanced", label = ("component_scope_advanced"), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_SNIPERRIFLE_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_HEAVYSNIPER",
		label = ("heavysniper"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_CLIP_01")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE")},
			{ name = "scope_advanced", label = ("component_scope_advanced"), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
		}
	},

	{
		name = "WEAPON_MARKSMANRIFLE_MK2",
		label = ("marksmanrifle_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_02")},
			{ name = "rounds_tracer", label = ("component_rounds_tracer"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{ name = "scope_large", label = ("component_scope_large"), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{ name = "scope_zoom", label = ("component_scope_zoom"), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "brake_flatmuzzle", label = ("component_brake_flatmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{ name = "brake_tacticalmuzzle", label = ("component_brake_tacticalmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{ name = "brake_fatendmuzzle", label = ("component_brake_fatendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{ name = "brake_precisionmuzzle", label = ("component_brake_precisionmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{ name = "brake_heavydutymuzzle", label = ("component_brake_heavydutymuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{ name = "brake_slantedmuzzle", label = ("component_brake_slantedmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{ name = "brake_splitendmuzzle", label = ("component_brake_splitendmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_MRFL_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_MRFL_BARREL_02")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
		}
	},

	{
		name = "WEAPON_HEAVYSNIPER_MK2",
		label = ("heavysniper_mk2"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02")},
			{ name = "rounds_incendiary", label = ("component_rounds_incendiary"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY")},
			{ name = "rounds_armorpiercing", label = ("component_rounds_armorpiercing"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING")},
			{ name = "rounds_fullmetaljacket", label = ("component_rounds_fullmetaljacket"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ")},
			{ name = "rounds_explosive", label = ("component_rounds_explosive"), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE")},
			{ name = "scope_zoom", label = ("component_scope_zoom"), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_MK2")},
			{ name = "scope_advanced", label = ("component_scope_advanced"), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
			{ name = "scope_nightvision", label = ("component_scope_nightvision"), hash = GetHashKey("COMPONENT_AT_SCOPE_NV")},
			{ name = "scope_thermal ", label = ("component_scope_thermal "), hash = GetHashKey("COMPONENT_AT_SCOPE_THERMAL")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_SR_SUPP_03")},
			{ name = "brake_squaredmuzzle ", label = ("component_brake_squaredmuzzle"), hash = GetHashKey("COMPONENT_AT_MUZZLE_08")},
			{ name = "brake_bellendmuzzle", label = ("component_brake_bellendmuzzle"), hash =GetHashKey("COMPONENT_AT_MUZZLE_09")},
			{ name = "barrel_default", label = ("component_barrel_default"), hash = GetHashKey("COMPONENT_AT_SR_BARREL_01")},
			{ name = "barrel_heavy", label = ("component_barrel_heavy"), hash = GetHashKey("COMPONENT_AT_SR_BARREL_02")},
		}
	},

	{
		name = "WEAPON_MARKSMANRIFLE",
		label = ("marksmanrifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "luxary_finish", label = ("component_luxary_finish"), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_VARMOD_LUXE")},
		}
	},

	{
		name = "WEAPON_GRENADELAUNCHER",
		label = ("grenadelauncher"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_GRENADELAUNCHER_CLIP_01")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
		}
	},
	
	{
		name = "WEAPON_MILITARYRIFLE",
		label = ("militaryrifle"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_MILITARYRIFLE_CLIP_01")},
			{ name = "clip_extended", label = ("component_clip_extended"), hash = GetHashKey("COMPONENT_MILITARYRIFLE_CLIP_02")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_MILITARYRIFLE_SIGHT_01")},
			{ name = "scope_medium", label = ("component_scope_medium"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
		}
	},
	
	{
		name = "WEAPON_COMBATSHOTGUN",
		label = ("combatshotgun"),
		components = {
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
		}
	},
	
	{
		name = "WEAPON_GADGETPISTOL",
		label = ("gadgetpistol"),
		components = {
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "suppressor", label = ("component_suppressor"), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
		}
	},

	{
		name = "WEAPON_NAVYREVOLVER",
		label = ("navyrevolver"),
		components = {},
	},

	{
		name = "WEAPON_RAYPISTOL",
		label = ("raypistol"),
		components = {},
	},

	{
		name = "WEAPON_RAYMINIGUN",
		label = ("rayminigun"),
		components = {},
	},

	{
		name = "WEAPON_RAYCARBINE",
		label = ("raycarbine"),
		components = {},
	},

	{
		name = "WEAPON_KNIFE",
		label = ("knife"),
		components = {},
	},

	{
		name = "WEAPON_NIGHTSTICK",
		label = ("nightstick"),
		components = {},
	},

	{
		name = "WEAPON_HAMMER",
		label = ("hammer"),
		components = {},
	},

	{
		name = "WEAPON_BAT",
		label = ("bat"),
		components = {},
	},

	{
		name = "WEAPON_GOLFCLUB",
		label = ("golfclub"),
		components = {},
	},

	{
		name = "WEAPON_CROWBAR",
		label = ("crowbar"),
		components = {},
	},

	{
		name = "WEAPON_RPG",
		label = ("rpg"),
		components = {},
	},

	{
		name = "WEAPON_STINGER",
		label = ("stinger"),
		components = {},
	},

	{
		name = "WEAPON_MINIGUN",
		label = ("minigun"),
		components = {},
	},

	{
		name = "WEAPON_GRENADE",
		label = ("grenade"),
		components = {},
	},

	{
		name = "WEAPON_STICKYBOMB",
		label = ("stickybomb"),
		components = {},
	},

	{
		name = "WEAPON_SMOKEGRENADE",
		label = ("smokegrenade"),
		components = {},
	},

	{
		name = "WEAPON_BZGAS",
		label = ("bzgas"),
		components = {},
	},

	{
		name = "WEAPON_MOLOTOV",
		label = ("molotov"),
		components = {},
	},

	{
		name = "WEAPON_FIREEXTINGUISHER",
		label = ("fireextinguisher"),
		components = {},
	},

	{
		name = "WEAPON_PETROLCAN",
		label = ("petrolcan"),
		components = {},
	},

	{
		name = "WEAPON_DIGISCANNER",
		label = ("digiscanner"),
		components = {},
	},

	{
		name = "WEAPON_BALL",
		label = ("ball"),
		components = {},
	},

	{
		name = "WEAPON_BOTTLE",
		label = ("bottle"),
		components = {},
	},

	{
		name = "WEAPON_DAGGER",
		label = ("dagger"),
		components = {},
	},

	{
		name = "WEAPON_FIREWORK",
		label = ("firework"),
		components = {},
	},

	{
		name = "WEAPON_MUSKET",
		label = ("musket"),
		components = {},
	},

	{
		name = "WEAPON_STUNGUN",
		label = ("stungun"),
		components = {},
	},

	{
		name = "WEAPON_HOMINGLAUNCHER",
		label = ("hominglauncher"),
		components = {},
	},

	{
		name = "WEAPON_PROXMINE",
		label = ("proxmine"),
		components = {},
	},

	{
		name = "WEAPON_SNOWBALL",
		label = ("snowball"),
		components = {},
	},

	{
		name = "WEAPON_FLAREGUN",
		label = ("flaregun"),
		components = {},
	},

	{
		name = "WEAPON_GARBAGEBAG",
		label = ("garbagebag"),
		components = {},
	},

	{
		name = "WEAPON_HANDCUFFS",
		label = ("handcuffs"),
		components = {},
	},

	{
		name = "WEAPON_MARKSMANPISTOL",
		label = ("marksmanpistol"),
		components = {},
	},

	{
		name = "WEAPON_KNUCKLE",
		label = ("knuckle"),
		components = {},
	},

	{
		name = "WEAPON_HATCHET",
		label = ("hatchet"),
		components = {},
	},

	{
		name = "WEAPON_STONE_HATCHET",
		label = ("stone_hatchet"),
		components = {},
	},

	{
		name = "WEAPON_RAILGUN",
		label = ("railgun"),
		components = {},
	},

	{
		name = "WEAPON_MACHETE",
		label = ("machete"),
		components = {},
	},

	{
		name = "WEAPON_SWITCHBLADE",
		label = ("switchblade"),
		components = {},
	},

	{
		name = "WEAPON_DBSHOTGUN",
		label = ("dbshotgun"),
		components = {},
	},

	{
		name = "WEAPON_AUTOSHOTGUN",
		label = ("autoshotgun"),
		components = {},
	},

	{
		name = "WEAPON_BATTLEAXE",
		label = ("battleaxe"),
		components = {},
	},

	{
		name = "WEAPON_COMPACTLAUNCHER",
		label = ("compactlauncher"),
		components = {},
	},

	{
		name = "WEAPON_PIPEBOMB",
		label = ("pipebomb"),
		components = {},
	},

	{
		name = "WEAPON_POOLCUE",
		label = ("poolcue"),
		components = {},
	},

	{
		name = "WEAPON_WRENCH",
		label = ("wrench"),
		components = {},
	},

	{
		name = "WEAPON_FLASHLIGHT",
		label = ("flashlight"),
		components = {},
	},

	{
		name = "GADGET_NIGHTVISION",
		label = ("gadget_nightvision"),
		components = {},
	},

	{
		name = "GADGET_PARACHUTE",
		label = ("gadget_parachute"),
		components = {},
	},

	{
		name = "WEAPON_FLARE",
		label = ("flare"),
		components = {},
	},

	{
		name = "WEAPON_DOUBLEACTION",
		label = ("doubleaction"),
		components = {},
	},
	
	{
		name = "WEAPON_FLASHBANG",
		label = "Flashbang",
		components = {},
	},
	
	{
		name = "WEAPON_GRENADELAUNCHER_SMOKE",
		label = ("grenadelauncher_smoke"),
		components = {
			{ name = "clip_default", label = ("component_clip_default"), hash = GetHashKey("COMPONENT_GRENADELAUNCHER_CLIP_01")},
			{ name = "scope", label = ("component_scope"), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{ name = "flashlight", label = ("component_flashlight"), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{ name = "grip", label = ("component_grip"), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
		}
	},
}

GetWeaponComponent = function(weaponName, weaponComponent)
	weaponName = string.upper(weaponName)
	local weapons = WeaponsList

	for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
			for j=1, #weapons[i].components, 1 do
				if weapons[i].components[j].name == weaponComponent then
					return weapons[i].components[j]
				end
			end
		end
	end
end

local WeaponsName = {
	['WEAPON_ADVANCEDRIFLE'] = 'advancedrifle',
	['WEAPON_APPISTOL'] = 'appistol',
	['WEAPON_ASSAULTRIFLE'] = 'assaultrifle',
	['WEAPON_ASSAULTRIFLE_MK2'] = 'assaultrifle_mk2',
	['WEAPON_ASSAULTSHOTGUN'] = 'assaultshotgun',
	['WEAPON_ASSAULTSMG'] = 'assaultsmg',
	['WEAPON_AUTOSHOTGUN'] = 'autoshotgun',
	['WEAPON_BALL'] = 'ball',
	['WEAPON_BAT'] = 'bat',
	['WEAPON_BATTLEAXE'] = 'battleaxe',
	['WEAPON_BOTTLE'] = 'bottle',
	['WEAPON_BULLPUPRIFLE'] = 'bullpuprifle',
	['WEAPON_BULLPUPRIFLE_MK2'] = 'bullpruprifle_mk2',
	['WEAPON_BULLPUPSHOTGUN'] = 'bullpupshotgun',
	['WEAPON_BZGAS'] = 'bzgas',
	['WEAPON_CARBINERIFLE'] = 'carbinerifle',
	['WEAPON_CARBINERIFLE_MK2'] = 'carbinerifle_mk2',
	['WEAPON_CERAMICPISTOL'] = 'ceramicpistol',
	['WEAPON_COMBATMG'] = 'combatmg',
	['WEAPON_COMBATMG_MK2'] = 'combatmg_mk2',
	['WEAPON_COMBATPDW'] = 'combatpdw',
	['WEAPON_COMBATPISTOL'] = 'combatpistol',
	['WEAPON_COMBATSHOTGUN'] = 'combatshotgun',
	['WEAPON_COMPACTLAUNCHER'] = 'compactlauncher',
	['WEAPON_COMPACTRIFLE'] = 'compactrifle',
	['WEAPON_CROWBAR'] = 'crowbar',
	['WEAPON_DAGGER'] = 'dagger',
	['WEAPON_DBSHOTGUN'] = 'dbshotgun',
	['WEAPON_DIGISCANNER'] = 'digiscanner',
	['WEAPON_DOUBLEACTION'] = 'doubleaction',
	['WEAPON_FIREEXTINGUISHER'] = 'fireextinguisher',
	['WEAPON_FIREWORK'] = 'firework',
	['WEAPON_FLARE'] = 'flare',
	['WEAPON_FLAREGUN'] = 'flaregun',
	['WEAPON_FLASHLIGHT'] = 'flashlight',
	['WEAPON_GADGETPISTOL'] = 'gadgetpistol',
	['WEAPON_GARBAGEBAG'] = 'garbagebag',
	['WEAPON_GOLFCLUB'] = 'golfclub',
	['WEAPON_GRENADE'] = 'grenade',
	['WEAPON_GRENADELAUNCHER'] = 'grenadelauncher',
	['WEAPON_GRENADELAUNCHER_SMOKE'] = 'grenadelauncher_smoke',
	['WEAPON_GUSENBERG'] = 'gusenberg',
	['WEAPON_HAMMER'] = 'hammer',
	['WEAPON_HANDCUFFS'] = 'handcuffs',
	['WEAPON_HATCHET'] = 'hatchet',
	['WEAPON_HEAVYPISTOL'] = 'heavypistol',
	['WEAPON_HEAVYSHOTGUN'] = 'heavyshotgun',
	['WEAPON_HEAVYSNIPER'] = 'heavysniper',
	['WEAPON_HEAVYSNIPER_MK2'] = 'heavysniper_mk2',
	['WEAPON_HOMINGLAUNCHER'] = 'hominglauncher',
	['WEAPON_KNIFE'] = 'knife',
	['WEAPON_KNUCKLE'] = 'knuckle',
	['WEAPON_MACHETE'] = 'machete',
	['WEAPON_MACHINEPISTOL'] = 'machinepistol',
	['WEAPON_MARKSMANPISTOL'] = 'marksmanpistol',
	['WEAPON_MARKSMANRIFLE'] = 'marksmanrifle',
	['WEAPON_MARKSMANRIFLE_MK2'] = 'marksmanrifle_mk2',
	['WEAPON_MG'] = 'mg',
	['WEAPON_MICROSMG'] = 'microsmg',
	['WEAPON_MILITARYRIFLE'] = 'militaryrifle',
	['WEAPON_MINIGUN'] = 'minigun',
	['WEAPON_MINISMG'] = 'minismg',
	['WEAPON_MOLOTOV'] = 'molotov',
	['WEAPON_MUSKET'] = 'musket',
	['WEAPON_NAVYREVOLVER'] = 'navyrevolver',
	['WEAPON_NIGHTSTICK'] = 'nightstick',
	['WEAPON_PETROLCAN'] = 'petrolcan',
	['WEAPON_PIPEBOMB'] = 'pipebomb',
	['WEAPON_PISTOL'] = 'pistol',
	['WEAPON_PISTOL50'] = 'pistol50',
	['WEAPON_PISTOL_MK2'] = 'pistol_mk2',
	['WEAPON_POOLCUE'] = 'poolcue',
	['WEAPON_PROXMINE'] = 'proxmine',
	['WEAPON_PUMPSHOTGUN'] = 'pumpshotgun',
	['WEAPON_PUMPSHOTGUN_MK2'] = 'pumpshotgun_mk2',
	['WEAPON_RAILGUN'] = 'railgun',
	['WEAPON_RAYCARBINE'] = 'raycarbine',
	['WEAPON_RAYMINIGUN'] = 'rayminigun',
	['WEAPON_RAYPISTOL'] = 'raypistol',
	['WEAPON_REVOLVER'] = 'revolver',
	['WEAPON_REVOLVER_MK2'] = 'revolver_mk2',
	['WEAPON_RPG'] = 'rpg',
	['WEAPON_SAWNOFFSHOTGUN'] = 'sawnoffshotgun',
	['WEAPON_SMG'] = 'smg',
	['WEAPON_SMG_MK2'] = 'smg_mk2',
	['WEAPON_SMOKEGRENADE'] = 'smokegrenade',
	['WEAPON_SNIPERRIFLE'] = 'sniperrifle',
	['WEAPON_SNOWBALL'] = 'snowball',
	['WEAPON_SNSPISTOL'] = 'snspistol',
	['WEAPON_SNSPISTOL_MK2'] = 'snspistol_mk2',
	['WEAPON_SPECIALCARBINE'] = 'specialcarbine',
	['WEAPON_SPECIALCARBINE_MK2'] = 'specialcarabine_mk2',
	['WEAPON_STICKYBOMB'] = 'stickybomb',
	['WEAPON_STINGER'] = 'stinger',
	['WEAPON_STONE_HATCHET'] = 'stone_hatchet',
	['WEAPON_STUNGUN'] = 'stungun',
	['WEAPON_SWITCHBLADE'] = 'switchblade',
	['WEAPON_VINTAGEPISTOL'] = 'vintagepistol',
	['WEAPON_WRENCH'] = 'wrench',
	['WEAPON_PAINTBALLBLUE'] = "Paintball Blue",
	['WEAPON_PAINTBALLRED'] = "Paintball Red",
	['WEAPON_FLASHBANG'] = "Flashbang",
	['GADGET_NIGHTVISION'] = "gadget_nightvision",
	['GADGET_PARACHUTE'] = "gadget_parachute",
}

GetWeaponName = function(weaponhash)
	for k,v in pairs(WeaponsName) do
		if weaponhash == GetHashKey(k) then
			return k
		end
	end
	return false
end