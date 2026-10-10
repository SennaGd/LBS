-- checks if file exists | parses tilda/home paths
function t_check(path)
	print("checking if file '"..path.."' exists.")
	
	local home = os.getenv("HOME") or ""
	if path:sub(1,1) == "~" or path:sub(1,1) == "" then
		path = home .. path:sub(2)
	elseif path:sub(1,2) == "~/" then
		path = home .. path:sub(3)
	else
		path = home .."/".. path
	end

	local f = io.open(path, "r")
	
	if f~=nil then
		io.close(f)
		return path 
	else
		return nil
	end
end


-- checks if given path is a directory
function is_dir(path)
    local f = io.open(path, "r")
    local ok, err, code = f:read(1)
    f:close()
    return code == 21
end


-- Adds content (i.e. files/folders) to .back file
function c_add(arguments)
	-- check for backupfile
	local check = io.open(arguments[1]..".back", "r")
	if not check then
		print("File '"..arguments[1]..".back' does not exist")
		return 	
	end

	for i = 2, #arguments do
		path = t_check(arguments[i])
		if path == nil then
			print("Given path '"..arguments[i].."' does not exist")
			return
		end 	
		
		local file = io.open(arguments[1] ..".back", "a")	

		if is_dir(path) then
			path = "FOLDER "..path.."\n"
		else
			path = "FILE "..path.."\n"
		end

		io.input(file)
		file:write(path)
		file:close()

		print("Added '"..arguments[i].."' to '"..arguments[1]..".back'")

	end
end
