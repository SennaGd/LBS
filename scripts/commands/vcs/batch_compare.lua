require("scripts.commands.vcs.myers_diff")


function get_vcs_filepath(version_folder, path)
	local filename = get_filename(path)
	local idx = filename:match(".*()%.") -- dot index
	filename = filename:sub(1, idx-1)

	return version_folder..filename..".ver"
end

--local function get_version_folder(args)
--	local backup_folder = get_backupfolder(args)
--	local backup_name = remove_extention(get_filename(args[2]))
--
--	return backup_folder.."/vcs/"..backup_name.."/"
--
--end

function get_version_folder(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))
return backup_folder.."/vcs/"..backup_name.."/" end

-- compares all files inside backupfile to new
function compare_all_files(args) 
	if not has_args(args) then return end
	
	local filepaths = extract_filepaths(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))
	
	local backup_path = backup_folder.."/container/"..backup_name.."/"

	local version_folder = get_version_folder(args)

	-- parses all files in backupfile
	for _, file in pairs(filepaths) do
		-- only files no folders
		if file:find("." ,1 ,true) ~= nil then
			local vcs_filepath = get_vcs_filepath(version_folder, file)

			local version = get_versions(vcs_filepath)
			--> write version to VCS file <--
			write_line(vcs_filepath, { "["..tostring(version+1).."]" }, "a")

			local seq_A = fetch_version(vcs_filepath, tonumber(version))
			local seq_B = get_contents(file)

			local changes = diff(seq_A, seq_B) --> compare seq_A to seq_B
			if changes == nil then break end   --> changes cant be empty

			for _, v in pairs(changes) do
				local v_type = "(=)"

				if v["type"] == "insert" then v_type = "(+)" end
				if v["type"] == "delete" then v_type = "(-)" end

				print(v_type, v["val"])

				--> writing changes to VCS file <--
				if v_type ~= "(=)" then
					write_line(vcs_filepath, {v_type.." "..v["val"]}, "a")
				else
					write_line(vcs_filepath, {v_type}, "a")
				end
			end	
		end
	end
end


-- returns latest version
function get_versions(filepath)
	local version = 1
	for line in io.lines(filepath) do
		if string.find(line, '%[') then
			version = line:sub(2,2)
		end
	end

	local versions = ""
	for i=1, (tonumber(version)-1) do
		versions = versions .. tostring(i) .. ", "
	end

	versions = versions .. version
	print("versions: ",versions)

	return version	
end

-- fetches version (x) and returns contents: table(lines)
-- takes string(filepath), number(version)
function fetch_version(filepath, target_version)

	local contents = {}
    local current_version = 0
    
    local next_contents = {}
    local read_index = 1

	for line in io.lines(filepath) do
		-- reset counter if new version found
		local ver_match = string.match(line, "^%[(%d+)%]")

		if ver_match then
			local ver_num = tonumber(ver_match)
			
			if current_version > 0 then
				contents = next_contents
			end

			if ver_num > target_version then
                break
            end
			current_version = ver_num
            next_contents = {}
            read_index = 1
		else
			if current_version > 0 and current_version <= target_version then
                local op = string.sub(line, 2, 2)
                local text = string.sub(line, 5) 
                
                if op == "=" then
                    table.insert(next_contents, contents[read_index])

                    read_index = read_index + 1
                elseif op == "+" then
                    table.insert(next_contents, text)
                elseif op == "-" then
                    read_index = read_index + 1
                end
            end
		end
	end

	if current_version <= target_version and current_version > 0 then
		contents = next_contents end

return contents	end

function write_version_to_file(args)
	if not has_args(args) then return end

	local filepaths = extract_filepaths(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))
	local backup_path = backup_folder.."/container/"..backup_name.."/"

	local version_folder = get_version_folder(args)

	if filepaths == nil then return end
	for _, file in pairs(filepaths) do
			local filename = get_filename(file)
			local backup_filepath = backup_path..filename
			local vcs_filepath = get_vcs_filepath(version_folder, file)

			--> fetch parsed contents <--
			local n_contents = fetch_version(vcs_filepath, 4)
			--> write version to VCS file <--
			write_line(backup_filepath, n_contents, "w")
	end
end
