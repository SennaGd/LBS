return {
    require("scripts.commands.core.help"),
    require("scripts.commands.core.version"),
    require("scripts.commands.core.test"),
    require("scripts.commands.core.test_fetch_old"),
    
    -- managing backupfiles 
    require("scripts.commands.backupfiles.new"),
    require("scripts.commands.backupfiles.read"),
    require("scripts.commands.backupfiles.delete"),
    require("scripts.commands.backupfiles.path"),
    require("scripts.commands.backupfiles.list"),

    -- handling contents of backupfiles
    require("scripts.commands.backupfiles.add_content"),
    require("scripts.commands.backupfiles.remove_content"),
    
    -- handling backups
    require("scripts.commands.backups.new_backup"),
    require("scripts.commands.backups.fetch_backup"),
}
