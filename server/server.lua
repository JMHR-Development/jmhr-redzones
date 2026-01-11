--[[
local version = GetResourceMetadata("jmhr-redzones", "version")
PerformHttpRequest("https://api.github.com/repos/JMHR-Development/jmhr-redzones/releases/latest", function(status, body)
    if status ~= 200 then
        print("^1[Version Check] Failed to check for updates. Status: " .. status .. "^0")
        return
    end

    local data = json.decode(body)
    local latest = data.tag_name or "0.0.0"

    if latest ~= version then
        print("^3[JMHR-Redzones] Version Check - Update available!^0")
        print("^3Current:^0 " .. version)
        print("^3Latest:^0  " .. latest)
        print("^3Download:^0 https://github.com/JMHR-Development/jmhr-redzones/releases/latest")
    else
        print("^2[JMHR-Redzones] Version Check - You are running the latest version (" .. version .. ")^0")
    end
end, "GET", "", { ["User-Agent"] = "FiveM-Version-Check" })
--]]

local inZone = {}

function sendToDiscord(webhook, title, message)
    if not server_config.discordLogs then return end
    local embed = {
        {
            ["color"] = 16753920,
            ["title"] = "**" .. title .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Made by jmhr.uk",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("jmhr-redzones:UpdateStatus", function(playerId, netId)
    inZone[source] = true
    
    if Config.deleteVehicles == true then
        if netId ~= 0 then
            DeleteEntity(NetworkGetEntityFromNetworkId(netId))
        end
    end
end)

RegisterNetEvent("jmhr-redzones:RewardPlayer", function(attackerSource, zoneKey)
    local src = source

    if server_config.trackKills then
        addKill(attackerSource)
        addDeath(src)
    end

    zone = Config.Zones[zoneKey]

    if inZone[src] and inZone[attackerSource] then
        inventory.addItem(attackerSource, zone.cashItem, zone.cashAmount)
        inventory.addItem(attackerSource, zone.rewardItems[math.random(1, #zone.rewardItems)], math.random(zone.rewardQuantity[1], zone.rewardQuantity[2]))
        
        sendToDiscord(server_config.reviveWebhook, "Redzone Player Rewarded:", "**Player Being Rewarded:** ID" .. attackerSource .. " (" .. GetPlayerName(attackerSource) .. ")" .. "\n **Victim Player:** ID" .. src .. " (" .. GetPlayerName(src) .. ")")
    end
end)

RegisterNetEvent("jmhr-redzones:HelpPlayer", function(zoneKey)
    local src = source 

    zone = Config.Zones[zoneKey]

    local itemCount = inventory.itemCount(src, zone.cashItem)
    if itemCount < zone.revivePrice then
        return
    end
    
    inventory.removeItem(src, zone.cashItem, zone.revivePrice)
    
    TriggerClientEvent("jmhr-redzones:TeleportOut", src)
    
    SetTimeout(zone.reviveTime, function()
        ambulance.revive(src)
    end)

    sendToDiscord(server_config.reviveWebhook, "Redzone Player Revived:", "**Player Being Revived:** ID" .. src .. " (" .. GetPlayerName(src) .. ")")

end) 
