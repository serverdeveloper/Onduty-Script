RegisterNetEvent('dosrp:onduty')
AddEventHandler('dosrp:onduty',function()
	local lPed = GetPlayerPed(-1)
  local model = GetHashKey("S_M_Y_BLACKOPS_01") -- Change model name here <--
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_combatpistol"), 1000, false)
          weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_carbinerifle"), 1000, false)
					weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_FLSH")
					weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_AFGRIP")
					weaponComponent("weapon_carbinerifle", "COMPONENT_AT_SCOPE_MEDIUM")
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false) -- Change weapon hash here <--
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_stungun"), 1000, false) -- Change weapon hash here <--
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_NIGHTSTICK"), 1000, false) -- Change weapon hash here <--
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        TriggerServerEvent('dosrp:message', GetPlayerName(PlayerId())) -- Change chatmessage here <--
        ShowNotification("Your Vehicle Spawncode: ~r~so10")
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function weaponComponent(weaponHash, component)
    if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponHash), false) then
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponHash), GetHashKey(component))
     end
end
	