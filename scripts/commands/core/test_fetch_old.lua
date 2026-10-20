function fetch_old_file(_args)
	local backup_p	= "/home/dev/Backups/container/sf/hello_world.py"
	local ver_p		= "/home/dev/Backups/vcs/sf/hello_world.ver"

	local b_contents = get_contents(backup_p)	
	local v_contents = get_contents(ver_p)
	
	local changes_v = {}
	for _, v in pairs(v_contents) do
		local v_list = {}
		local v_sub = v:sub(1,2)

		if v_sub == "CH" then
			v_list = {v_sub, v:sub(4)}	
		else 
			v_list = {v_sub, nil}
		end
		table.insert(changes_v,v_list)
	end

	local idx = 1
	local counter = 1

	for _, v in pairs(v_contents) do
		print(v)
	end
	for i=1, math.max(#b_contents, #v_contents) do
		if string.match(v_contents[i],"%[") then
		--	print("Version: ", v_contents[i])
			idx = idx + 1
			counter = 1
		end
		
		-- skip empty version lines
		if v_contents[idx] == nil then 
		goto continue end
		
		if v_contents[idx]:sub(1,2) == "CH" then
			b_contents[counter] = v_contents[idx]:sub(4)
		elseif v_contents[idx]:sub(1,2) == "UP" then
			b_contents[counter-1] = v_contents[idx]:sub(4)
		elseif v_contents[idx]:sub(1,2) == "DO" then
			b_contents[counter+1] = v_contents[idx]:sub(4)
		end

		if b_contents[i] == "" then
			b_contents[i] = "-"
		end
		-- print("Contents: ", v_contents[idx]:sub(1,2), b_contents[counter])
		
		idx = idx+1
		counter = counter + 1
		::continue::
	end

	for i=1, #b_contents do
		--print(b_contents[i])
	end
end


