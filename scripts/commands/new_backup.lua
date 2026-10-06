function new_backup(arguments)
	
	if io.open(arguments[1]..".back", "a") then
		print("Created new backup file: "..arguments[1]..".back")
	else
		print("Failed to create file")
	end
end
return new_backup
