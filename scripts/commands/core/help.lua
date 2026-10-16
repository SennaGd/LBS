function string_fmt(string)
	return string
	-- font weight
	:gsub("<b>", "\27[1m")	-- bold

	-- colors
	:gsub("<R>", "\27[31m") -- red
	:gsub("<G>", "\27[32m") -- green
	:gsub("<Y>", "\27[33m") -- yellow
	:gsub("<B>", "\27[34m") -- blue 

    :gsub("</>", "\27[0m")	-- reset char
end

function c_help(_arguments) 
	local content = string_fmt([[
Usage: <b>LBS</> <B>[COMMAND]</><b>... <Y>[ARGS]</><b>...</>
Backup System handling backups with backupfiles.

Mandatory arguments to long options are mandatory for short options too.
  <b>new, -n</>
	Creating a new backup-file
	Args: [FILENAME]
  <b>delete, -d</>
	Removing an existing backup-file
	Args: [FILENAME]
  <b>add, -a</>
	Adding file/folder to backup-file
	Args: [BACKUPFILE] [FILE/FOLDER]
	
	FILE/FOLDER should be in $HOME directory
	<b></>Only checks for files inside the <b><R>HOME DIRECTORY </><b>(i.e. "<Y>/home/username/</><b>")</>
  <b>remove, -r</>
	Removing file/folder of backup-file
	Args: [BACKUPFILE] [FILE/FOLDER]
  <b>read, -r</>
	Reads existing backup-file's contents
	Args: [BACKUPFILE]
  <b>backup, -b</>
	Creating a new backup or overwrites existing backup
	Args: [BACKUPFILE]
  <b>fetch, -f</>
	Fetches existing backup, replaces existing directories 
	Args: [BACKUPFILE]
  <b>fetch -o, -fo</>
	Fetches previous version of existing backup, replaces directories

  <b>help, --help</>
	Displays this help and exit
  <b>version, --version</>
	Output version information and exit

]])

		print(content)
end
