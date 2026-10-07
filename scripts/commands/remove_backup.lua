function c_remove(arguments)
	if not arguments[1] then 
		print("Error: No argument given")
		return
	end
	local result, message = os.remove(arguments[1]..".back")
	if result then
		print("File '"..arguments[1].."' deleted successfully")
	else
		print("Error: File '"..arguments[1].."' could not be deleted.\n", message)
	end
end
