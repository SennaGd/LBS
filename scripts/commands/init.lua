return {
	require("scripts.commands.help"),
	require("scripts.commands.version"),
	
	-- managing backupfiles 
	require("scripts.commands.backupfiles.new_backup_f"),
	require("scripts.commands.backupfiles.read_backup_f"),
	require("scripts.commands.backupfiles.delete_backup_f"),
	require("scripts.commands.backupfiles.path_backup_f"),
	require("scripts.commands.backupfiles.list_backup_f"),

	-- handling contents of backupfiles
	require("scripts.commands.backupfiles.add_content"),
	require("scripts.commands.backupfiles.remove_content"),
	
	-- handling backups
	require("scripts.commands.backups.new_backup"),
}
