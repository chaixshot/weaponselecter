RegisterNUICallback('buyItem', function(data, cb)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(data.name)
	local ammoType = GetPedAmmoTypeFromWeapon_2(playerPed, weaponHash)
	SendNUIMessage({
		type = "playSound",
		name = "ammopickup1",
	})
	TriggerEvent("weaponselecter:OnBuy", data)
	if data.name == "armor" then
		SetPedArmour(PlayerPedId(), 100)
	elseif data.name == "defusekit" then
		TriggerEvent("weaponselecter:OnPlayerSelectDefusekit")
	else
		local Ammo = Config.ammo
		if data.name == "weapon_smokegrenade" or data.name == "weapon_flashbang" or data.type == "melee" then
			Ammo = 1
		end

		if data.type == "pistol" then
			Ammo = math.floor(Ammo / 2)
		end

		GiveWeaponToPed(playerPed, weaponHash, Ammo, false, true)
		if string.find(data.name, "mk2") then
			SetPedWeaponTintIndex(playerPed, weaponHash, tonumber(data.skin))
		else
			if data.skin > 6 then
				data.skin = 6
			end
			SetPedWeaponTintIndex(playerPed, weaponHash, tonumber(data.skin))
		end
		if Config.infinite then
			SetPedInfiniteAmmo(playerPed, true, weaponHash)
		end
		for k, v in pairs(Config.AllComponent) do
			if not Config.clip and string.find(v[1], "clip_") then

			else
				local component = GetWeaponComponent(data.name, v[1])
				if component then
					GiveWeaponComponentToPed(playerPed, weaponHash, component.hash)
				end
			end
		end
	end
	if data.name ~= "weapon_smokegrenade" and data.name ~= "weapon_flashbang" then
		SendNUIMessage({
			type = "removeweapon",
			weapon = data.name,
		})
	end
end)

RegisterNUICallback('getweaponstatus', function(data, cb)
	local retval, hudDamage, hudSpeed, hudCapacity, hudAccuracy, hudRange = GetWeaponHudStats(GetHashKey(data.weaponname))
	SendNUIMessage({
		type = "setStatusHUD",
		retval = retval,
		hudDamage = hudDamage,
		hudSpeed = hudSpeed,
		hudAccuracy = hudAccuracy,
		hudRange = hudRange,
	})
end)

RegisterNUICallback('focusOff', function(data, cb)
	TriggerEvent("weaponselecter:close")
end)

RegisterNUICallback('nomoney', function(data, cb)
	SendNUIMessage({
		type = "playSound",
		name = "nothing",
	})
end)

function OpenWeaponMenu(data)
	local _WeaponList = {}

	MenuOpen = true

	Config.infinite = data.infinite
	Config.ammo = data.ammo
	Config.clip = (data.clip == nil and false or data.clip)
	Config.disablecontrol = (data.disablecontrol == nil and true or data.disablecontrol)
	Config.removeweapon = {}

	SetNuiFocus(true, true)
	SendNUIMessage({
		type = "clearmenu",
		display = true,
	})
	SendNUIMessage({
		type = "playSound",
		name = "ammopickup2",
	})

	if data.removeweapon then
		for k, v in pairs(data.removeweapon) do
			Config.removeweapon[v] = true
		end
	end

	for k, v in pairs(Config.WeaponList) do
		if not Config.removeweapon[k] then
			table.insert(_WeaponList, v)
		end
	end

	table.sort(_WeaponList, function(a, b)
		return a["itemLabel"] < b["itemLabel"]
	end)

	for k, v in pairs(_WeaponList) do
		SendNUIMessage({
			type = "createweaponmenu",
			weapontype = v.type,
			item = v.item,
			itemLabel = v.itemLabel,
			price = v.price,
		})
	end

	if data.removetype then
		for k, v in pairs(data.removetype) do
			SendNUIMessage({
				type = "removetype",
				weapontype = v,
			})
		end
	end

	if Config.disablecontrol then
		while MenuOpen do
			SetPlayerControl(PlayerId(), false, 256)
			Citizen.Wait(0)
		end
	end
end

AddEventHandler('weaponselecter:open', function(data)
	OpenWeaponMenu(data)
end)

AddEventHandler('weaponselecter:close', function()
	if MenuOpen then
		SendNUIMessage({
			type = "clearmenu",
			display = false,
		})
		SendNUIMessage({
			type = "playSound",
			name = "ammopickup2",
		})
		MenuOpen = false
		SetNuiFocus(false, false)
		SetPlayerControl(PlayerId(), true, 0)
	end
end)

AddEventHandler('weaponselecter:setmoney', function(money)
	SendNUIMessage({
		type = "setcurrentmoney",
		money = money,
	})
end)

AddEventHandler('weaponselecter:addmoney', function(money)
	SendNUIMessage({
		type = "addcurrentmoney",
		money = money,
	})
end)

AddEventHandler('weaponselecter:removemoney', function(money)
	SendNUIMessage({
		type = "addcurrentmoney",
		money = money,
	})
end)

-- Citizen.CreateThread(function()
-- 	Citizen.Wait(100)
-- 	TriggerEvent("weaponselecter:setmoney", 1000)
-- 	TriggerEvent("weaponselecter:open", {ammo=80, infinite=false, removeweapon={""}})
-- 	TriggerEvent("weaponselecter:open", {ammo=200, infinite=true, removetype={"submachine", "assault", "shotgun", "sniper", "melee", "tool", "grenade"}})
-- end)
