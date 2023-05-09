local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("givePlayerPhoneItem5")
AddEventHandler("givePlayerPhoneItem5", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("electronickit", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["electronickit"], 'add')
    TriggerClientEvent('phone:client:ShowNotification', src, 'You have received an iPhone!')
end)
