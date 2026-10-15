
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
	local filepaths = extract_filepaths(args)

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
		local o_lines = fetch_contents(string.gsub(v, " ", ""))		 --> origin lines
		
		--? Should return: E, C, D, D, C, D, E
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
	if not has_args(args) then return end

	local file = args[2]
	if not file_exists(file) then 
		print("File '" .. args[2] .. "' does not exist") 
	return end

	local filename = fetch_last_word(args[2])
	filename = rm_file_extention(filename)

	local backup_path = fetch_backupfolder(args) .. "/container/"..filename
	
	for line in io.lines() do
		for word in string.gmatch(line, "[^%s]+") do
			if word == "FOLDER" or word == "FILE" then 
				goto continue	
			end

			-- making backup directory
			local mkdir_cmd = "mkdir -p " .. backup_path

			-- Copying contents to directory
			local copy_cmd = "yes | cp -rf ".. word .. " " .. backup_path .. "/"
			
			os.execute(mkdir_cmd)
			os.execute(copy_cmd)

			print("created backup at '"..backup_path.."'")
			
			::continue::
		end
	end
end

