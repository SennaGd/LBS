-- Reads .back files contents
function c_read(arguments, backups)
	if not arguments[1] then 
		print("Error: No argument given")
	else
		local backupfile = backups .. arguments[1] .. ".back"
		local file = io.open(backupfile, "r")
		if file then
			local content = file:read("*a") -- "*a" reads the ENTIRE file
			file:close()
			print(content)
		else
			print("Error: File '" .. backupfile .. "' does not exist")
		end
	end
end
