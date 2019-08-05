AddEventHandler("chatMessage", function(source, name, message)
	cm = stringsplit(message, " ")

	if cm[1] == "/onduty" then
		CancelEvent()
		TriggerClientEvent("dosrp:onduty", source)
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterNetEvent('dosrp:message')
AddEventHandler('dosrp:message',function(name)
  TriggerClientEvent('chatMessage', -1, "^*Community Officer", { 255, 26, 71 }, name .. " is now onduty!") -- Change chatmessage here <--
end)
