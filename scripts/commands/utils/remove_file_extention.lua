-- removes extention from complete filename (i.e. "file.txt" to "file")
function rm_file_extention(filename)
	return filename:sub(1,filename:find("%.back")-1)
end
