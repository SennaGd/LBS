-- Creates a new .back file
function c_new(args)
	if not has_args(args) then return end

	-- check if backup folder exists | else create it
	os.execute("mkdir -p " .. os.getenv("HOME").."/Backups/backupfiles ")

	if io.open(args[2],"a") then
		print("Created new backup file '" .. args[2] .. "'")
	else
		print("Failed to create file")
	end
end
