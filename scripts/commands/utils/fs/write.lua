-- write entries -> {"entry", "entry2"} to filepath
function write_line(filepath, entries, mode)
	local file = io.open(filepath, mode)
	if not file then return false end

	for _, entry in pairs(entries) do
		file:write(entry.."\n")	
	end

	return file:close()
end
