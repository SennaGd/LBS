-- Deletes given .back file
function c_delete(args)
	if not has_args(args) then return end
	
	local result, message = os.remove(args[2])
	if result then
		print("File '".. args[2] .. "' deleted successfully")
	else
		print("Error: File '" .. args[2] .. "' could not be deleted.\n", message)
	end
end
