-- Removes content from .back fille
function c_remove(args)
	if not has_args(args) then return end

	-- check if backupfile exists
	local filepath = args[2]
	if not file_exists(filepath) then 
		print("File '" .. filepath .. "' does not exist") 
	return end


	local entries = {}
		for line in io.lines(filepath) do
			-- backupfile
			local path = parse_delimiters(args[3])
			if path ~= line then
				table.insert(entries, line)
			end
		end

	if write_line(filepath, entries, "w") then
		print("Successfully updated '" .. filepath .. "'")
	else
		print("Couldn't open '" .. filepath .. "' for writing")
	end
end

