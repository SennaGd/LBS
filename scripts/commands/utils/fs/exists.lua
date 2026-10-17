-- checks if file exists 
function file_exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end

	if f == nil then
		print("File: "..file.." does not exists")
	end

return f ~= nil end --> returns true/false
