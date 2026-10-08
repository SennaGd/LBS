-- Creates a new .back file
function c_new(arguments)
	if io.open(arguments[1]..".back", "a") then
		print("Created new backup file: "..arguments[1]..".back")
	else
		print("Failed to create file")
	end
end
