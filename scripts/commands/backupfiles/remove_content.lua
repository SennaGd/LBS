-- Removes content from .back fille
function c_remove(args)
	if args[1] == nil then
		print("Error: no arguments given")
		return
	end

	local content = "" -- contains new file content 

	-- check if args[2] exists
	local check = io.open(args[2], "r")
	if not check then
		print("File '"..args[2]..".back' does not exist")
		return 	
	end


	local file = io.open(args[2], "r")
	io.input(file)

	for line in io.lines() do
		-- loop over words in line 
		for token in string.gmatch(line, "[^%s]+") do
		    if token ~= "FOLDER" and token ~= "FILE" then
				path = token
				break
			end
		end

		-- append line to new content | should stay in file
		if args[3] ~= path then
			content = content .. line .. "\n" 
		else
			print("Removed '"..path.."' from '" .. args[2] .. "'") 
		end
	end

	-- close read file
	io.close(file)

	-- writing new contents of "content" to file
	file = io.open(args[2], "w")
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
