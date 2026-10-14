function fetch_filepath(args)
	local backup_folder = string.gsub(args[2], ".back", "")
	
	fetch_backupfolder(args)
	local file = io.open(args[2], "r")
	if not file then
		print("File '" .. args[2] .. "' does not exist")
		return
	end

	io.input(file)
	
	filepaths = {}
	for line in io.lines() do
		parsed_line = string.gsub(line, "FILE", ""):gsub("FOLDER", "")
		table.insert(filepaths, parsed_line)
	end
	
	return filepaths

end

function fetch_backupfolder(args)
	return string.gsub(args[2], ".back", "")
end


function fetch_last_word(filepath)
	for s_word in filepath:gmatch"[^/,\r\n]+" do
		if s_word ~= nil then
			last_word = s_word
		end
	end

	return last_word
end

function file_exists(file)
	local f = io.open(file, "rb")
	if file then f:close() end
	return f ~= nil
end

function fetch_contents(file)
	if not file_exists(file) then return {} end
	local lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end


function compare_files(args) 
	if args[1] == nil then
		print("Error: no arguments given")
		return
	end

	local backup_folder = fetch_backupfolder(args)	
	filepaths = fetch_filepath(args)

	for k, v in pairs(filepaths) do
		local is_file = string.find(v, "." ,1 ,true)
		-- make sure comparing goes only for files not directories
		if is_file == nil then
			goto continue
		end
		
		local filename = fetch_last_word(v)

		local b_lines = fetch_contents(backup_folder.."/"..filename) --> backup lines
		local o_lines = fetch_contents(string.gsub(v, " ", "")) --> origin lines


		-- o_lines = new 
		for i = 1, math.max(#b_lines, #o_lines)	do
			if b_lines[i] ~= o_lines[i] then

				print("Line: "..i, "has changed")
				if b_lines[i] ~= nil then
					print("from: "..b_lines[i])
				end
				if o_lines[i] ~= nil then
					print("to:   "..o_lines[i])
				end
			end
		end


		::continue::
	end
end


function c_create_backup(args)
	if args[1] == nil then
		print("Error: no arguments given")
		return
	end

	local file = io.open(args[2], "r")
	if not file then
		print("File '" .. args[2] .. "' does not exist")
	end

	io.input(file)	

		
	local backup_folder = string.gsub(args[2], ".back", "")
	for line in io.lines() do
		for word in string.gmatch(line, "[^%s]+") do
			
			if word == "FOLDER" then 
				is_file = false
				goto continue	
			end
			
			if word == "FILE" then
				is_file = true 
				goto continue	
			end

			-- fetching last word in directory string
			for s_word in word:gmatch"[^/,\r\n]+" do
				if s_word ~= nil then
					folder_name = s_word
				end
			end

			print("folder_name:",backup_folder.."/"..folder_name)
			-- making backup directory
			local mkdir_cmd = "mkdir -p " .. backup_folder 

			-- Copying contents to directory
			local copy_cmd = "yes | cp -rf ".. word .. " " .. backup_folder .. "/" 
			

			
			os.execute(mkdir_cmd)
			local copy = os.execute(copy_cmd)
			print(copy)

			::continue::
		end
	end
end

-- hello, this was added whilst the program was running!
-- hurm
-- Hello
