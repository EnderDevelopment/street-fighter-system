local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

-- Combat Mechanics
local isInCombat = false
local combatCooldown = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 24) and not isInCombat and not combatCooldown then -- Attack
            TriggerServerEvent('streetfighter:attack')
            combatCooldown = true
            Citizen.SetTimeout(Config.CombatCooldown, function() combatCooldown = false end)
        elseif IsControlJustPressed(1, 22) and not isInCombat and not combatCooldown then -- Block
            TriggerServerEvent('streetfighter:block')
            combatCooldown = true
            Citizen.SetTimeout(Config.CombatCooldown, function() combatCooldown = false end)
        elseif IsControlJustPressed(1, 21) and not isInCombat and not combatCooldown then -- Dodge
            TriggerServerEvent('streetfighter:dodge')
            combatCooldown = true
            Citizen.SetTimeout(Config.CombatCooldown, function() combatCooldown = false end)
        end
    end
end)

-- UI and Player Interactions
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- Draw UI elements here
    end
end)

-- Admin Panel
if Config.AdminPanel.enabled then
    RegisterCommand(Config.AdminPanel.command, function(source, args, rawCommand)
        -- Open admin panel UI here
    end, false)
end