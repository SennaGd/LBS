-- Removes content from .back fille
function c_remove(args)
	print(args[1])
	if not has_args(args) then return end

	-- check if backupfile exists
	local filepath = args[2]
	if not file_exists(filepath) then 
		print("File '" .. filepath .. "' does not exist") 
	return end


	local content = "" -- contains new file content 

	for line in io.lines(filepath) do
		-- loop over words in line 
		for token in string.gmatch(line, "[^%s]+") do
		    if token ~= "FOLDER" and token ~= "FILE" then
				path = token
			break end
		end

		-- append line to new content | should stay in file
		local input = parse_delimiters(args[3])
		if input ~= path then
			content = content .. line .. "\n" 
		else
			print("Removed '"..path.."' from '" .. filepath .. "'") 
		end
	end

	-- writing new contents of "content" to file
	backup_file = io.open(filepath, "w")
	if backup_file then
		local parsed_content = ""

		if type(content) == "table" then
			parsed_content = table.concat(content, "\n")
		else
			parsed_content = tostring(content)
		end

		backup_file:write(parsed_content)
		backup_file:flush()
		backup_file:close()
	end
end
