---@diagnostic disable: undefined-global

require("scripts.command_proc")
require("scripts.commands.new_backup")
local command	= command	or ""
local arguments = arguments or {}


local command_list = {
	["hello"] = new_backup(arguments),
}

--for k, v in pairs(arguments) do
--	print(k, v)
--end

local func = command_list[command]
if func then
	func()
end
