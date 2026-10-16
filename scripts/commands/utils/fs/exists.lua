-- checks if file exists 
function file_exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
return f ~= nil end --> returns true/false
