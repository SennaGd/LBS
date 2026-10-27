function fetch_old_file(_args)
	local backup_p	= "/home/dev/Backups/container/sf/hello_world.py"
	local new_file = "/home/dev/Documents/hello_world.py"
	local ver_p		= "/home/dev/Backups/vcs/sf/hello_world.ver"

	local b_contents = get_contents(backup_p)	-- old file
	local n_contents = get_contents(new_file) -- new file

	
	print("\n-----------", "comparing contents", "-----------")
	local changes = {}	
	for i=1, math.max(#b_contents, #n_contents) do
		local old_curr = b_contents[i]
		local old_prev = b_contents[i-1]
		local old_next = b_contents[i+1]

		local new_curr = n_contents[i]
		local new_prev = n_contents[i-1]
		local new_next = n_contents[i+1]
	

		local change = nil
		local prev_change = changes[i-1]
		print("\nline: ",i)
		-- Moved Up
		if old_curr == new_prev and old_next == new_curr then
			print(i.."^", new_prev)
			change = i.."^"
		-- Moved Down
		elseif old_curr == new_next and old_prev == new_curr then
			print(i.."v", new_next)
			change = i.."v"
		-- Changed
		elseif old_curr ~= new_curr then
			if changes[i-1] ~= nil and prev_change == "v" or prev_change == "^" then
			
			print(i.."~", new_curr)
			change = i.."~"
			end
		-- Equal
		elseif old_curr == new_curr then 
			print("-- [equal] --")
			change = i.."="
		end
		
		print("[type]","[Old]", "[New]")
		print("prev",old_prev, new_prev)
		print("curr",old_curr, new_curr)
		print("next",old_next, new_next)


		if change ~= nil then
			table.insert(changes, change)
		end

		print("\nPrevious Change", changes[i-1])
	end
	for _, v in pairs(changes) do
		print(v)
	end
end


