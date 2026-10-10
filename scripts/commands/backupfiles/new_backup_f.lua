require("scripts.commands.command_parser.dir_type")

-- Creates a new .back file
function c_new(arguments, backups)
	local backupfile = backups .. arguments[1] .. ".back"

	-- check if backup folder exists
	local folder = os.execute("mkdir " .. backups)
	if folder then
		print("creating backups folder at '" .. backups .. "'")
	end

	if io.open(backupfile,"a") then
		print("Created new backup file '" .. backupfile .. "'")
	else
		print("Failed to create file")
	end
end
