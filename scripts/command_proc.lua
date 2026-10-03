-- command processor --

-- @param input string
function fetch_output(input)
	for char in input:gmatch("%w+") do
		print(char)
	end
end
