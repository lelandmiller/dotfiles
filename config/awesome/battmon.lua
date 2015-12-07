local awful = require("awful")
local wibox = require("wibox")
local mybattmon = wibox.widget.textbox()

function setBatteryMessage()
    local message = awful.util.pread("battery")
    mybattmon:set_markup('<span foreground="' .. base07 .. '"> ' .. message .. '</span>')    
end
setBatteryMessage()
mybattmontimer = timer({ timeout = 10 })
mybattmontimer:connect_signal("timeout", function() setBatteryMessage() end)
mybattmontimer:start()

return mybattmon
