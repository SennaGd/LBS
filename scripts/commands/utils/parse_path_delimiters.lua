-- parses arguments for delimiters and appends paths accordingly
function c_path_delimiters(path)
	local home = os.getenv("HOME") or ""

	if path:sub(1,1) == "~" or path:sub(1,1) == "" then
		path = home .. path:sub(2)
	elseif path:sub(1,2) == "~/" then
		path = home .. path:sub(3)
	else
		path = home .."/".. path
	end
return path end
