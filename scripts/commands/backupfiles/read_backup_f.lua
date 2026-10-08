-- Reads .back files contents
function c_read(arguments)
	if not arguments[1] then 
		print("Error: No argument given")
	else
		local file = io.open(arguments[1]..".back", "r")
		if file then
			local content = file:read("*a") -- "*a" reads the ENTIRE file
			file:close()
			print(content)
		else
			print("Error: File '".. arguments[1] .. "' does not exist")
		end
	end
end
