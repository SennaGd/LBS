-- fetches /home/USR/Backups/
function get_backupfolder(args)
	local start_idx, end_idx = string.find(args[2], "Backups")
return string.sub(args[2], 1, end_idx) end
