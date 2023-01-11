local QBCore = exports['qb-core']:GetCoreObject()

local LastRob = 0

local isActive = false

function DiscordLog(message)
    local embed = {
        {
            ["color"] = 04255, 
            ["title"] = "RoyalDevelopment Thermite Mission",
            ["description"] = message,
            ["url"] = "https://discord.gg/e4AYS3VE",
            ["footer"] = {
            ["text"] = "By RoyalDevelopment",
            ["icon_url"] = Config.LogsImage
        },
            ["thumbnail"] = {
                ["url"] = Config.LogsImage,
            },
    }
}
    PerformHttpRequest(Config.WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'RL-ThermiteMission', embeds = embed, avatar_url = Config.LogsImage}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("RL-ThermiteMission:Server:GuardsSync", function() 
    TriggerClientEvent("RL-ThermiteMission:GuardsSync", -1)
end) 

RegisterNetEvent('RL-ThermiteMission:server:SetActive', function(status)
    if status ~= nil then
        isActive = status
        TriggerClientEvent('RL-ThermiteMission:client:SetActive', -1, isActive)
    else
        TriggerClientEvent('RL-ThermiteMission:client:SetActive', -1, isActive)
    end
end)

RegisterNetEvent("RL-ThermiteMission:SendDiscordLog", function()
    local src = source
    local steamname = GetPlayerName(src)
    DiscordLog('Thermite Mission Started By: **'..steamname..'** ID: **' ..src..'**')
end)