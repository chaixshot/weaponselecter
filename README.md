# Weapon Selector
```lua
TriggerEvent("weaponselecter:setmoney", 10000) -- Set weapon selector money
TriggerEvent("weaponselecter:addmoney", 100) -- Add money to weapon selector
TriggerEvent("weaponselecter:removemoney", 100) -- Remove money from weapon selector
TriggerEvent("weaponselecter:open", { -- Open weapon selector
  ammo = 200, -- How many ammo can get form give weapon
  infinite = true, -- Weapon should infinite ammo?
  removetype = { -- Remove weapon category list
    "submachine",
    "assault",
    "shotgun",
    "sniper",
    "melee",
    "tool",
    "grenade",
  }
})
TriggerEvent("weaponselecter:close") -- Close weapon selector
```

# Example Menu
```lua
TriggerEvent("weaponselecter:setmoney", 10000)
TriggerEvent("weaponselecter:open", {ammo=80, infinite=false, removeweapon={""}})
```
![image](https://github.com/user-attachments/assets/1388d691-ce96-4931-b02b-8e39548cfe1a)
![image](https://github.com/user-attachments/assets/47da4956-9519-4a1f-b564-9b87159966f7)

```lua
TriggerEvent("weaponselecter:setmoney", 500)
TriggerEvent("weaponselecter:open", {ammo=200, infinite=true, removetype={"submachine", "assault", "shotgun", "sniper", "melee", "tool", "grenade"}})
```
![image](https://github.com/user-attachments/assets/79d88251-062d-4f14-a48d-f7af9f3a3c04)

# Quick Slot
```lua
QS:ThreadStart() -- Start quick weapon select
QS:ThreadStop() -- Stop quick weapon select
QS:Visible() -- Check quick weapon slot is visible?
QS:Visible(false) -- Set quick slot hide
QS:Visible(true) -- Set quick slot show
```
![image](https://github.com/user-attachments/assets/92976132-450a-4b7b-a4ff-0b638428cf7e)
