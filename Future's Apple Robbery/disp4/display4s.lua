local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("givePlayerPhoneItem4")
AddEventHandler("givePlayerPhoneItem4", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("laptop_green", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["laptop_green"], 'add')
    TriggerClientEvent('phone:client:ShowNotification', src, 'You have received an iPhone!')
end)
