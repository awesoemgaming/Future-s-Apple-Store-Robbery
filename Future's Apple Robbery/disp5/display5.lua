local promptDisplayed = false
local canUsePhone = true

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local areaCoords = vector3(153.92, -229.15, 54.42)

        local distance = #(playerCoords - areaCoords)

        if distance <= 0.5 and not promptDisplayed then
            promptDisplayed = true
            DisplayHelpText("Press ~INPUT_CONTEXT~ to interact")
        elseif distance > 0.5 and promptDisplayed then
            promptDisplayed = false
            ClearPedTasksImmediately(playerPed)
        end

        if promptDisplayed and IsControlJustReleased(0, 38) and canUsePhone then
            canUsePhone = false
            TriggerServerEvent('givePlayerPhoneItem5')
            RequestAnimDict("anim@heists@ornate_bank@grab_cash")
            while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") do
                Citizen.Wait(100)
            end
            TaskPlayAnim(playerPed, "anim@heists@ornate_bank@grab_cash", "intro", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1500)
            TaskPlayAnim(playerPed, "anim@heists@ornate_bank@grab_cash", "grab", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1500)
            TaskPlayAnim(playerPed, "anim@heists@ornate_bank@grab_cash", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000 * 60)
            canUsePhone = true
        end
    end
end)

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


RegisterNetEvent('phone:client:ShowNotification')
AddEventHandler('phone:client:ShowNotification', function(msg)
    QBCore.Functions.Notify(msg, "success")
end)
