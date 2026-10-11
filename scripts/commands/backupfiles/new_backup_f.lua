require("scripts.commands.command_parser.dir_type")

-- Creates a new .back file
function c_new(args)
	-- check if backup folder exists | else create it
	local folder = os.execute("mkdir " .. os.getenv("HOME").."/Backups/")
	if folder then
		print("creating backups folder at '" .. backups .. "'")
	end

	if io.open(args[2],"a") then
		print("Created new backup file '" .. args[2] .. "'")
	else
		print("Failed to create file")
	end
end
