local WPM = {
	Ammo = 0,
	Clip = false,
	money = 0,
}

RegisterNUICallback('buyItem', function(data, cb)
	TriggerEvent("weaponselecter:OnBuy", data)

	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(data.name)
	local ammoType = GetPedAmmoTypeFromWeapon_2(playerPed, weaponHash)
	local ammo = WPM.Ammo

	SendNUIMessage({
		type = "playSound",
		name = "ammopickup1",
	})

	if data.name == "armor" then
		SetPedArmour(PlayerPedId(), 100)
	elseif data.name == "defusekit" then
		TriggerEvent("weaponselecter:OnPlayerSelectDefusekit")
	else
		if data.name == "weapon_smokegrenade" or data.name == "weapon_flashbang" or data.type == "melee" then
			ammo = 1
		end

		if data.type == "pistol" then
			ammo = math.floor(ammo / 2)
		end

		GiveWeaponToPed(playerPed, weaponHash, ammo, false, true)

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
			if not WPM.Clip and string.find(v[1], "clip_") then

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
			type = "removeWeapon",
			weapon = data.name,
		})
	end
end)

RegisterNUICallback('getWeaponStat', function(data, cb)
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

function WPM:Visible(_visible)
	if _visible then
		self.visible = _visible
	else
		return self.visible
	end
end

function WPM:Open(data)
	self:Visible(true)
	self.Infinite = data.infinite
	self.Ammo = data.ammo
	self.Clip = (data.clip == nil and false or data.clip)

	SetNuiFocus(true, true)

	SendNUIMessage({
		type = "clearMenu",
		display = true,
	})

	SendNUIMessage({
		type = "playSound",
		name = "ammopickup2",
	})

	local weaponList = {}
	local removeList = {}

	if data.removeweapon then
		for _, name in pairs(data.removeweapon) do
			removeList[name] = true
		end
	end

	for name, data in pairs(Config.WeaponList) do
		if not removeList[name] then
			table.insert(weaponList, data)
		end
	end

	-- Sort weaon list by name
	table.sort(weaponList, function(a, b)
		return a["itemLabel"] < b["itemLabel"]
	end)

	-- Insert weapon list to menu
	for k, v in pairs(weaponList) do
		SendNUIMessage({
			type = "createWeaponList",
			weapontype = v.type,
			item = v.item,
			itemLabel = v.itemLabel,
			price = v.price,
		})
	end

	-- Remove weapon category
	if data.removetype then
		for k, v in pairs(data.removetype) do
			SendNUIMessage({
				type = "removeType",
				weapontype = v,
			})
		end
	end

	-- Disable player control
	while self:Visible() and data.disablecontrol do
		SetPlayerControl(PlayerId(), false, 256)

		Citizen.Wait(0)
	end
end

function WPM:Close()
	if WPM:Visible() then
		WPM:Visible(false)

		SendNUIMessage({
			type = "clearMenu",
			display = false,
		})

		SendNUIMessage({
			type = "playSound",
			name = "ammopickup2",
		})

		SetNuiFocus(false, false)
		SetPlayerControl(PlayerId(), true, 0)
	end
end

function WPM:SetMoney(money)
	self.money = money
	SendNUIMessage({
		type = "setMoney",
		money = money,
	})
end

function WPM:AddMoney(money)
	self.money += money
	SendNUIMessage({
		type = "addMoney",
		money = money,
	})
end

function WPM:RemovMoney(money)
	self.money -= money
	SendNUIMessage({
		type = "removeMoney",
		money = money,
	})
end

AddEventHandler('weaponselecter:open', function(data)
	WPM:Open(data)
end)

AddEventHandler('weaponselecter:close', function()
	WPM:Close()
end)

AddEventHandler('weaponselecter:setmoney', function(money)
	WPM:SetMoney(money)
end)

AddEventHandler('weaponselecter:addmoney', function(money)
	WPM:AddMoney(money)
end)

AddEventHandler('weaponselecter:removemoney', function(money)
	WPM:RemovMoney(money)
end)

--** Tester
-- Citizen.CreateThread(function()
-- 	Citizen.Wait(100)
-- 	TriggerEvent("weaponselecter:setmoney", 100000)
-- 	TriggerEvent("weaponselecter:open", {ammo = 80, infinite = false, removeweapon = {""}})
-- 	TriggerEvent("weaponselecter:open", {ammo = 200, infinite = true, removetype = {"submachine", "assault", "shotgun", "sniper", "melee", "tool", "grenade"}})
-- end)

--[[
RegisterCommand('wpm', function(source, args)
	WPM:SetMoney(100000)
	WPM:Open({
		ammo = 200,
		infinite = true,
		removeweapon = {
			"weapon_grenade"
		},
		removetype = {
			"submachine", "assault", "shotgun", "sniper", "melee", "tool", "grenade"
		}
	})
end, false)
]]
