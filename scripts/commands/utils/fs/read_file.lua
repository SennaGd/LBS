function get_contents(file)
	local lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
return lines end
