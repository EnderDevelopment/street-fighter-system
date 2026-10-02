local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Player Data Management
ESX.RegisterServerCallback('streetfighter:getPlayerData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchAll('SELECT * FROM street_fighter_players WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1] then
            cb(result[1])
        else
            MySQL.Async.execute('INSERT INTO street_fighter_players (identifier) VALUES (@identifier)', {
                ['@identifier'] = identifier
            }, function()
                cb({xp = 0, level = 1, skill_points = 0, cash = Config.StartingCash, rank = 'Novice'})
            end)
        end
    end)
end)

-- Combat Mechanics
RegisterServerEvent('streetfighter:attack')
AddEventHandler('streetfighter:attack', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    -- Handle attack logic here
    -- Update player stats and XP
    MySQL.Async.execute('UPDATE street_fighter_players SET xp = xp + @xp WHERE identifier = @identifier', {
        ['@xp'] = Config.XPPerFight,
        ['@identifier'] = identifier
    })
end)

RegisterServerEvent('streetfighter:block')
AddEventHandler('streetfighter:block', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    -- Handle block logic here
    -- Update player stats
end)

RegisterServerEvent('streetfighter:dodge')
AddEventHandler('streetfighter:dodge', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    -- Handle dodge logic here
    -- Update player stats
end)

-- Progression and Economy
RegisterServerEvent('streetfighter:earnCash')
AddEventHandler('streetfighter:earnCash', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    xPlayer.addMoney(amount)
    MySQL.Async.execute('UPDATE street_fighter_players SET cash = cash + @amount WHERE identifier = @identifier', {
        ['@amount'] = amount,
        ['@identifier'] = identifier
    })
end)

-- Admin Panel
if Config.AdminPanel.enabled then
    ESX.RegisterServerCallback('streetfighter:adminGetPlayers', function(source, cb)
        local xPlayers = ESX.GetPlayers()
        local players = {}

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            table.insert(players, {
                identifier = xPlayer.identifier,
                name = xPlayer.getName()
            })
        end

        cb(players)
    end)

    RegisterServerEvent('streetfighter:adminUpdatePlayer')
    AddEventHandler('streetfighter:adminUpdatePlayer', function(identifier, data)
        -- Update player data in database here
    end)
end