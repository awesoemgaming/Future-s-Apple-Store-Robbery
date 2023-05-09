local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("givePlayerPhoneItem3")
AddEventHandler("givePlayerPhoneItem3", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("tablet", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["tablet"], 'add')
    TriggerClientEvent('phone:client:ShowNotification', src, 'You have received an tablet!')
end)
