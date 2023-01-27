usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "ScanSnap S1300i") then
        
    end
    if (data["eventType"] == "added") then
        hs.notify.new({title="Device Connected", informativeText=data["productName"] .. " [" .. data["vendorID"] .. ":" .. data["productID"] .. "] has been connected!"}):send()
    elseif (data["eventType"] == "removed") then
        hs.notify.new({title="Device Disconnected", informativeText=data["productName"] .. " [" .. data["vendorID"] .. ":" .. data["productID"] .. "] has been disconnected!"}):send()
	end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
