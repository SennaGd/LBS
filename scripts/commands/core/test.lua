local compare_files = require("scripts.commands.vcs.file_compare")

local function get_vcs_filepath(version_folder, path)
	local filename = get_filename(path)
	local idx = filename:match(".*()%.") -- dot index
	filename = filename:sub(1, idx-1)

	return version_folder..filename..".ver"
end

local function get_version_folder(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))

	return backup_folder.."/vcs/"..backup_name.."/"

end

local function read_vcs_file(filepath)
	print("vcs")
	local line_count = 1
	local new_ver_line = 1

	for line in io.lines(filepath) do
		if string.find(line,'%[') then
			new_ver_line = line_count
			print(new_ver_line)
		end

		line_count = line_count + 1
	end
end

function version_control(args)
	if not has_args(args) then return end
	
	local filepath = args[2]
	local version_folder = get_version_folder(args)

	local backup_name = remove_extention(get_filename(args[2]))
	local backup_path = get_backupfolder(args).."/container/"..backup_name.."/"

	local mkdir_cmd = "mkdir -p " .. version_folder
	os.execute(mkdir_cmd)
	
	-- making version file
	for line in io.lines(filepath) do
		vcs_filepath = get_vcs_filepath(version_folder, line)
		if not file_exists(vcs_filepath) then
			make_file(vcs_filepath)
			-- write_line(vcs_filepath, {"[1]"}, "a")
		end

		if vcs_filepath ~= nil then
			read_vcs_file(vcs_filepath)
		end
	end

	-- checking O_file > N_file
	local changes = table

	local filepaths = extract_filepaths(args)
	for _, file in pairs(filepaths) do
		if not is_dir(file) then
			local filename = get_filename(file)
			changes = compare_files(
				backup_path..filename,
				file
			)
		end

		if changes ~= nil then
			for _,v in pairs(changes) do
				if v[3] == nil then
					v[3] = ""
				end
				print(v[3])

				-- write_line(
				-- vcs_filepath, 
				--	{parsed_line},
				--	"a"
				--)
			end
		end
	end
end







