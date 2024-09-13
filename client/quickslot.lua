local QS = {
	_visible = false,
	delayTime = 0,
	threadStart = false,
}

RegisterCommand('+gameroom_weapon_slot_1', function() -- assault
	if DecorGetInt(PlayerPedId(), "GameRoom") ~= 0 then
		HudWeaponWheelIgnoreSelection()
		if (GetGameTimer() - QS.delayTime) > 600 and not IsPlayerDead(PlayerId()) and not IsPedShooting(PlayerPedId()) and not IsPedJumping(PlayerPedId()) then
			QS.delayTime = GetGameTimer()
			local weapon = GetWeaponInSlot(1)
			if weapon then
				SetCurrentPedWeapon(PlayerPedId(), weapon, true)
				SendNUIMessage({
					type = "usequickslot",
					slot = "1",
				})
				SendNUIMessage({
					type = "playSound",
					name = "awp_deploy",
				})
			else
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), false)
				SendNUIMessage({
					type = "usequickslot",
					slot = "0",
				})
			end
		end
	end
end, false)
RegisterCommand('-gameroom_weapon_slot_1', function()
end, false)
RegisterKeyMapping('+gameroom_weapon_slot_1', 'gameroom_weapon_slot_1 ', 'keyboard', "1")

RegisterCommand('+gameroom_weapon_slot_2', function() -- Pistal
	if DecorGetInt(PlayerPedId(), "GameRoom") ~= 0 then
		HudWeaponWheelIgnoreSelection()
		if (GetGameTimer() - QS.delayTime) > 600 and not IsPlayerDead(PlayerId()) and not IsPedShooting(PlayerPedId()) and not IsPedJumping(PlayerPedId()) then
			QS.delayTime = GetGameTimer()
			local weapon = GetWeaponInSlot(2)
			if weapon then
				SetCurrentPedWeapon(PlayerPedId(), weapon, true)
				SendNUIMessage({
					type = "usequickslot",
					slot = "2",
				})
				SendNUIMessage({
					type = "playSound",
					name = "m4a1_deploy",
				})
			else
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), false)
				SendNUIMessage({
					type = "usequickslot",
					slot = "0",
				})
			end
		end
	end
end, false)
RegisterCommand('-gameroom_weapon_slot_2', function()
end, false)
RegisterKeyMapping('+gameroom_weapon_slot_2', 'gameroom_weapon_slot_2 ', 'keyboard', "2")

RegisterCommand('+gameroom_weapon_slot_3', function() -- melee
	if DecorGetInt(PlayerPedId(), "GameRoom") ~= 0 then
		if (GetGameTimer() - QS.delayTime) > 600 and not IsPlayerDead(PlayerId()) and not IsPedShooting(PlayerPedId()) and not IsPedJumping(PlayerPedId()) then
			QS.delayTime = GetGameTimer()
			HudWeaponWheelIgnoreSelection()
			local weapon = GetWeaponInSlot(3)
			if weapon then
				SetCurrentPedWeapon(PlayerPedId(), weapon, true)
				SendNUIMessage({
					type = "usequickslot",
					slot = "3",
				})
				SendNUIMessage({
					type = "playSound",
					name = "knife_deploy",
				})
			else
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), false)
				SendNUIMessage({
					type = "usequickslot",
					slot = "0",
				})
			end
		end
	end
end, false)
RegisterCommand('-gameroom_weapon_slot_3', function()
end, false)
RegisterKeyMapping('+gameroom_weapon_slot_3', 'gameroom_weapon_slot_3 ', 'keyboard', "3")

RegisterCommand('+gameroom_weapon_slot_4', function() -- grenade
	if DecorGetInt(PlayerPedId(), "GameRoom") ~= 0 then
		HudWeaponWheelIgnoreSelection()
		if (GetGameTimer() - QS.delayTime) > 600 and not IsPlayerDead(PlayerId()) and not IsPedShooting(PlayerPedId()) and not IsPedJumping(PlayerPedId()) then
			QS.delayTime = GetGameTimer()
			local weapon = GetWeaponInSlot(4)
			if weapon then
				SetCurrentPedWeapon(PlayerPedId(), weapon, true)
				SendNUIMessage({
					type = "usequickslot",
					slot = "4",
				})
				SendNUIMessage({
					type = "playSound",
					name = "de_deploy",
				})
			else
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), false)
				SendNUIMessage({
					type = "usequickslot",
					slot = "0",
				})
			end
		end
	end
end, false)
RegisterCommand('-gameroom_weapon_slot_4', function()
end, false)
RegisterKeyMapping('+gameroom_weapon_slot_4', 'gameroom_weapon_slot_4 ', 'keyboard', "4")

AddEventHandler('DarkRP_Bomb:OnSessionStart', function()
	QS:Thread()
end)
AddEventHandler('DarkRP_Bomb:OnSessionEnd', function()
	QS.threadStart = false
end)

AddEventHandler('DarkRP_Teamdeathmacth:OnSessionStart', function()
	QS:Thread()
end)
AddEventHandler('DarkRP_Teamdeathmacth:OnSessionEnd', function()
	QS.threadStart = false
end)

AddEventHandler('DarkRP_Deathmacth:OnSessionStart', function()
	QS:Thread()
end)
AddEventHandler('DarkRP_Deathmacth:OnSessionEnd', function()
	QS.threadStart = false
end)

AddEventHandler('DarkRP_Aimlab:CreateThread', function()
	QS:Thread()
end)
AddEventHandler('DarkRP_Aimlab:QuitPaintball', function()
	QS.threadStart = false
end)

AddEventHandler('DarkRP_Boxing:CreateThread', function()
	QS:Thread()
end)
AddEventHandler('DarkRP_Boxing:QuitPaintball', function()
	QS.threadStart = false
end)

AddEventHandler('DarkRP_Zombie_Infection:CreateThread', function()
	QS:Thread()
end)
AddEventHandler('DarkRP_Zombie_Infection:QuitPaintball', function()
	QS.threadStart = false
end)

function GetWeaponInSlot(slot)
	local playerPed = PlayerPedId()
	local currentweapon = GetSelectedPedWeapon(playerPed)
	local weapon = false
	local nextweapon = false
	local weaponcount = 0
	local _WeaponList = {}
	for k, v in pairs(Config.WeaponList) do
		if (slot == 1 and (v.type == "submachine" or v.type == "shotgun" or v.type == "assault" or v.type == "sniper")) or (slot == 2 and (v.type == "pistol")) or (slot == 3 and (v.type == "melee")) or (slot == 4 and (v.type == "grenade")) then
			local _weapon = GetPedWeapontypeInSlot(playerPed, GetWeapontypeSlot(GetHashKey(k)))
			if _weapon ~= 0 then
				table.insert(_WeaponList, k)
				weaponcount += 1
				if weaponcount == 2 then
					break
				end
			end
		end
	end

	for k, v in pairs(_WeaponList) do
		local _weapon = GetPedWeapontypeInSlot(playerPed, GetWeapontypeSlot(GetHashKey(v)))
		if not weapon and _weapon ~= 0 and (_weapon ~= currentweapon or weaponcount == 1) then
			weapon = _weapon
			nextweapon = GetHashKey(_WeaponList[(k + 1 > #_WeaponList and 1 or k + 1)])
		end
	end

	return (weapon ~= 0 and weapon or false), nextweapon, (weaponcount == 1 and 0 or weaponcount)
end

function QS:Visible(_visible)
	if _visible == nil then
		return self._visible
	elseif _visible ~= self._visible then
		self._visible = _visible
		SendNUIMessage({
			type = "showquickslot",
			quickslot = _visible,
		})
	end
end

function QS:Thread()
	self.threadStart = true
	self:Visible(true)

	while self.threadStart do
		local playerPed                    = PlayerPedId()
		local slot1, slotnext1, slotcount1 = GetWeaponInSlot(1)
		local slot2, slotnext2, slotcount2 = GetWeaponInSlot(2)
		local slot3, slotnext3, slotcount3 = GetWeaponInSlot(3)
		local slot4, slotnext4, slotcount4 = GetWeaponInSlot(4)

		SendNUIMessage({
			type = "setquickslot",
			slot = "1",
			slotcount = slotcount1,
			weapon = GetWeaponName(slot1),
			weaponnext = GetWeaponName(slotnext1),
			ammoclip = GetAmmoInPedWeapon(playerPed, slot1),
			ammoclipnext = GetAmmoInPedWeapon(playerPed, slotnext1),
		})

		SendNUIMessage({
			type = "setquickslot",
			slot = "2",
			slotcount = slotcount2,
			weapon = GetWeaponName(slot2),
			weaponnext = GetWeaponName(slotnext2),
			ammoclip = GetAmmoInPedWeapon(playerPed, slot2),
			ammoclipnext = GetAmmoInPedWeapon(playerPed, slotnext2),
		})

		SendNUIMessage({
			type = "setquickslot",
			slot = "3",
			slotcount = slotcount3,
			weapon = GetWeaponName(slot3),
			weaponnext = GetWeaponName(slotnext3),
			ammoclip = "⠀",
			ammoclipnext = "⠀",
		})

		SendNUIMessage({
			type = "setquickslot",
			slot = "4",
			slotcount = slotcount4,
			weapon = GetWeaponName(slot4),
			weaponnext = GetWeaponName(slotnext4),
			ammoclip = GetAmmoInPedWeapon(playerPed, slot4),
			ammoclipnext = GetAmmoInPedWeapon(playerPed, slotnext4),
		})

		DisableControlAction(1, 157, false)
		DisableControlAction(1, 158, false)
		DisableControlAction(1, 160, false)
		DisableControlAction(1, 164, false)

		if IsPlayerDead(PlayerId()) or IsPlayerSwitchInProgress() or IsScreenFadingOut() then
			self:Visible(false)
		else
			self:Visible(true)
		end

		Citizen.Wait(0)
	end

	self:Visible(false)
end

AddEventHandler('weaponselecter:hideQuickSlot', function()
	QS:Visible(false)
end)

-- CreateThread(function()
-- Wait(100)
-- DecorSetInt(PlayerPedId(), "GameRoom", 10)
-- QuickSlotThread()
-- end)
