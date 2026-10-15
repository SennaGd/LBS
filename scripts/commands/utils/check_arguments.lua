-- checks if argumens array contains items 
function has_args(args) 
	if not args[1] then
		print("Error: no arguments given")
		return false
	end
	return true
end
