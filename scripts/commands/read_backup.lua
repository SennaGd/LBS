function c_read(arguments)
	local file = io.open(arguments[1], "r")
	if file then
		local content = file:read("*a") -- "*a" reads the ENTIRE file
		file:close()
		print(content)
	end
end
