-- Deletes given .back file
function c_delete(arguments, backups)
	if not arguments[1] then 
		print("Error: No argument given")
		return
	end

	local backupfile = backups .. arguments[1] .. ".back"

	local result, message = os.remove(backupfile)
	if result then
		print("File '".. backupfile .. "' deleted successfully")
	else
		print("Error: File '" .. backupfile .. "' could not be deleted.\n", message)
	end
end
