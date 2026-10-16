-- Removes content from .back file
function c_remove(args)
	if not has_args(args) then return end

	-- check if backupfile exists
	local filepath = args[2]
	if not file_exists(filepath) then 
		print("File '" .. filepath .. "' does not exist") 
	return end

	local entries = {}
	for line in io.lines(filepath) do
		local in_file = false

		for i=3, #args do
			local path = parse_delimiters(args[i])
			if path == line then
				in_file = true
			end
		end

		if not in_file then
			table.insert(entries, line)
		end
	end

	if write_line(filepath, entries, "w") then
		print("Successfully updated '" .. filepath .. "'")
	else
		print("Couldn't open '" .. filepath .. "' for writing")
	end
end

