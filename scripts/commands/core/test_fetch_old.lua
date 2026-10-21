function fetch_old_file(_args)
	local backup_p	= "/home/dev/Backups/container/sf/hello_world.py"
	local ver_p		= "/home/dev/Backups/vcs/sf/hello_world.ver"

	local b_contents = get_contents(backup_p)	
	local v_contents = get_contents(ver_p)

	for _,v in pairs(v_contents) do
		print(v)
	end
end


