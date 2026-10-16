local function is_tilda(filepath)
	return filepath:sub(1,1) == "~" end

local function is_absolute(filepath)
	return filepath:sub(1,1) == "/" end

-- parses arguments for delimiters and appends paths accordingly
function parse_delimiters(filepath)
	local home = os.getenv("HOME") or ""
	
	if is_tilda(filepath) then
		return home .. filepath:sub(2) 
	elseif is_absolute(filepath) then
		return filepath				   
	end
return home.."/"..filepath end

