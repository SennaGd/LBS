-- Reads .back files contents
function c_read(args)
	if not args[2] then 
		print("Error: No argument given")
	else
		local file = io.open(args[2], "r")
		if file then
			local content = file:read("*a") -- "*a" reads the ENTIRE file
			file:close()
			print(content)
		else
			print("Error: File '" .. args[2] .. "' does not exist")
		end
	end
end
