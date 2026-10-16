local compare_files = require("scripts.commands.vcs.file_compare")

-- compares all files inside backupfile to new
function compare_all_files(args) 
	if not has_args(args) then return end

	local filepaths = extract_filepaths(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))
	
	local backup_path = backup_folder.."/container/"..backup_name.."/"

	for _, file in pairs(filepaths) do
		if file:find("." ,1 ,true) ~= nil then
			file = file:sub(2)
			local filename = get_filename(file)

			compare_files(backup_path..filename, file)
		end
	end
end


