
-- taking in backup line/origin line
-- returns integer value 

local function is_shifted_up(prev_old_line, current_new_line)
	return prev_old_line ~= nil and prev_old_line == current_new_line
end

local function is_shifted_down(next_old_line, current_new_line)
	return next_old_line ~= nil and next_old_line == current_new_line
end

local function is_exact_match(old_line, new_line)
	return old_line == new_line 
end


function compare_line_state(old_lines, new_lines, counter)
	local current_new_line = new_lines[counter]

	if is_exact_match(old_lines[counter], current_new_line) then
		return "EQUAL"
	elseif is_shifted_up(old_lines[counter+1], current_new_line) then
		return "SHIFTED_UP"
	elseif is_shifted_down(old_lines[counter-1], current_new_line) then
		return "SHIFTED_DOWN"
	end

	return "CHANGED" 
end



local function print_changes(changes)
	for k, v in pairs(changes) do
		print(v[1])
		--> v[1] == change type states[v[1]]
		--> v[2] == old version
		--> v[3] == new version
	end
end

local function get_file_changes(old_contents, new_contents)
	local changes = {}
	for i = 1, math.max(#old_contents, #new_contents) do
		local line_state = compare_line_state(old_contents, new_contents, i) 
		table.insert(changes, {line_state, old_contents[i], new_contents[i]})
	end
	
	return changes 
end


local function compare_files(old_filepath, new_filepath)
	local old_contents = fetch_contents(old_filepath)
	local new_contents = fetch_contents(new_filepath)

	local changes = get_file_changes(old_contents, new_contents)
	print_changes(changes)
end


-- compares all files inside backupfile to new
function compare_all_files(args) 
	if not has_args(args) then return end

	local filepaths = extract_filepaths(args)
	local backup_folder = fetch_backupfolder(args)
	local backup_name = rm_file_extention(get_file_name(args[2]))
	
	local backup_path = backup_folder.."/container/"..backup_name.."/"

	for k, v in pairs(filepaths) do
		if v:find("." ,1 ,true) == nil then
			goto continue
		end

		v = v:sub(2)
		local filename = get_file_name(v)

		compare_files(backup_path..filename, v)

		::continue::
	end
end


function c_create_backup(args)
	if not has_args(args) then return end

	local file = args[2]
	if not file_exists(file) then 
		print("File '" .. file .. "' does not exist") 
	return end

	local filename = get_file_name(args[2])
	filename = rm_file_extention(filename)

	local backup_path = fetch_backupfolder(args) .. "/container/"..filename
	print("before loop")	
	for line in io.lines(file) do
		for word in string.gmatch(line, "[^%s]+") do
			print(word)
			if word == "FOLDER" or word == "FILE" then 
				goto continue	
			end

			-- making backup directory
			local mkdir_cmd = "mkdir -p " .. backup_path

			-- Copying contents to directory
			local copy_cmd = "yes | cp -rf ".. word .. " " .. backup_path .. "/"
			print("running backup..")
			os.execute(mkdir_cmd)
			os.execute(copy_cmd)

			print("created backup at '"..backup_path.."'")
			
			::continue::
		end
	end
end

