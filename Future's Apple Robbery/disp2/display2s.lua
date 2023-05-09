local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("givePlayerPhoneItem2")
AddEventHandler("givePlayerPhoneItem2", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("iphone", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["iphone"], 'add')
    TriggerClientEvent('phone:client:ShowNotification', src, 'You have received an iPhone!')
end)
