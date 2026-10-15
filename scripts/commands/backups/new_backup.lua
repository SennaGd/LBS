function fetch_filepath(args)
	local backup_folder = string.gsub(args[2], ".back", "")
	
	local file = io.open(args[2], "r")
	if not file then
		print("File '" .. args[2] .. "' does not exist")
		return
	end

	io.input(file)
	
	local filepaths = {}
	for line in io.lines() do
		-- insert parsed line into filepaths
		local p_line = string.gsub(line, "FILE", ""):gsub("FOLDER", "") 
		table.insert(filepaths, p_line)
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

-- taking in backup line/origin line
-- returns integer value 
function compare_line_state(b_lines, o_lines, counter)
	local state = 1
	if b_lines[counter] ~= o_lines[counter] then
		state = 4
	end

	if b_lines[counter-1] == o_lines[counter] then
		state = 2
	elseif b_lines[counter+1] == o_lines[counter] then
		state = 3
	end

	return state
end


function compare_files(args) 
	if args[1] == nil then
		print("Error: no arguments given")
		return
	end

	local backup_folder = fetch_backupfolder(args)	
	local filepaths = fetch_filepath(args)

	local states = {
		{ "equal", "=" },
		{ "down", "-" },
		{ "up", "+" },
		{ "changed", "/" }
	}
	local line_state = 0 
	for k, v in pairs(filepaths) do
		-- make sure comparing goes only for files not directories
		if string.find(v, "." ,1 ,true) == nil then
			goto continue
		end
		
		local filename = fetch_last_word(v)

		local b_lines = fetch_contents(backup_folder.."/"..filename) --> backup lines
		local o_lines = fetch_contents(string.gsub(v, " ", "")) --> origin lines
		
		--print("comparing"..backup_folder.."/"..filename.." to"..v)
		-- Should return: E, C, D, D, C, D, E
		local changes = {}
		for i = 1, math.max(#b_lines, #o_lines)	do
			line_state = compare_line_state(b_lines, o_lines, i) 
			table.insert(changes, {line_state, b_lines[i], o_lines[i]})
		end
		
		for k, v in pairs(changes) do
			--> v[1] == change type states[v[1]]
			--> v[2] == old version
			--> v[3] == new version
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
		
	local backup_folder = fetch_backupfolder(args)
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
