files = {
	"is_dir",
	"file_exists",
	"parse_path_delimiters",
	"check_arguments",
	"extract_filepaths",
	"fetch_backupfolder",
	"extract_last_word",
	"fetch_file_contents",
}

for i = 1, #files do
	require("scripts.commands.utils."..files[i])
end

