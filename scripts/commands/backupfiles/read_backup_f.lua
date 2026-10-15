-- Reads .back files contents
function c_read(args)
	if not has_args(args) then return end

	local file = args[2]
	if not file_exists(file) then 
		print("File '" .. file .. "' does not exist") 
	return end

	file = io.open(file, "r")
	print(file:read("*a")) 
	file:close()
end
