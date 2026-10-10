-- Removes content from .back fille
function c_remove(arguments, backups)
	local content = "" -- contains new file content 
	local backupfile = backups .. arguments[1] .. ".back"

	-- check if backupfile exists
	local check = io.open(backupfile,"r")
	if not check then
		print("File '"..backupfile..".back' does not exist")
		return 	
	end

	local file = io.open(backupfile, "r")
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
		if arguments[2] ~= path then
			content = content .. line .. "\n" 
		else
			print("Removed '"..path.."' from '" .. backupfile .. "'") 
		end
	end

	-- close read file
	io.close(file)

	-- writing new contents of "content" to file
	file = io.open(backupfile, "w")
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
