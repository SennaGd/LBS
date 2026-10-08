-- Removes content from .back fille
function c_remove(arguments)
	local check = io.open(arguments[1]..".back", "r")
	if not check then
		print("File '"..arguments[1]..".back' does not exist")
		return 	
	end

	file = io.open(arguments[1]..".back", "r")
	io.input(file)
	
	local content = "" 
	for line in io.lines() do
		for token in string.gmatch(line, "[^%s]+") do
		    if token ~= "FOLDER" and token ~= "FILE" then
				path = token
				break
			end
		end
		if arguments[2] ~= path then
			content = content .. line .. "\n" 
		else
			print("Removed '"..path.."' from '"..arguments[1]..".back'") 
		end
	end

	io.close(file)

	-- writing new contents to file
	local file = io.open(arguments[1]..".back", "w")
	if file then
		local parsed_content = ""
		if type(content) == "table" then
			parsed_content = table.concat(content, "\n")
		else
			parsed_content = tostring(content)
		end

		file:write(parsed_content)
		file:flush()
		file:close()
	end

end
