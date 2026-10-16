files = {
    "utils.core.validate_args",

    "utils.fs.exists",
    "utils.fs.get_backup_dir",
    "utils.fs.is_dir",
    "utils.fs.read_file",

    "utils.path.extract_filepaths",
    "utils.path.get_filename",
    "utils.path.parse_delimiters",
    "utils.path.remove_extention",

	"vcs.batch_compare",
	"vcs.file_compare",
	"vcs.line_state",
}

for i = 1, #files do
	require("scripts.commands."..files[i])
end

