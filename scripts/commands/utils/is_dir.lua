-- checks if given path is a directory 
function is_dir(path)
    local f = io.open(path, "r")
	if not f then return false end

    local _, _, code = f:read(1)
    f:close()
    return code == 21 -- return true if code:21
end

