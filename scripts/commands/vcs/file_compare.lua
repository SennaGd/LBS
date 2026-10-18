local compare_line_state = require("scripts.commands.vcs.line_state")

local function print_changes(changes)
	for _, v in pairs(changes) do
		print(v[1],"to:", v[3])
		--> v[1] == change type states[v[1]]
		--> v[2] == old version
		--> v[3] == new version
	end
end


local function get_file_changes(old_contents, new_contents)
	local changes = {}
	for i = 1, math.max(#old_contents, #new_contents) do
		local line_state = compare_line_state(old_contents, new_contents, i) 
		table.insert(changes, {line_state, old_contents[i], new_contents[i]})
	end
	
	return changes 
end


return function (old_filepath, new_filepath)
	local old_contents = get_contents(old_filepath)
	local new_contents = get_contents(new_filepath)

	local changes = get_file_changes(old_contents, new_contents)
	--print_changes(changes)
return changes end


