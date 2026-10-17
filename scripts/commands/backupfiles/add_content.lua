-- Adds content (i.e. files/folders) to .back file
function c_add(args)
	if not has_args(args) then return end

	-- check if backupfile exists
	local filepath = args[2]

	if not file_exists(filepath) then 
	return end

	local entries = {}
	for i = 3, #args do 
		local path = parse_delimiters(args[i])

		if not file_exists(path) then
		return end

		table.insert(entries, path)
	end

	if write_line(filepath, entries, "a") then
		print("Successfully updated '" .. filepath .. "'")
	else
		print("Couldn't open '" .. filepath .. "' for writing")
	end
end

