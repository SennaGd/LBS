-- removes extention from complete filename (i.e. "file.txt" to "file")
function remove_extention(filename)
	if filename == nil then return filename end
	print(filename)
	return filename:sub(1,filename:find("%.back")-1)
end
