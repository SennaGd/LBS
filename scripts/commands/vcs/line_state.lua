local function is_shifted_up(prev_old_line, current_new_line)
	return prev_old_line ~= nil and prev_old_line == current_new_line
end

local function is_shifted_down(next_old_line, current_new_line)
	return next_old_line ~= nil and next_old_line == current_new_line
end

local function is_exact_match(old_line, new_line)
	return old_line == new_line 
end


return function(old_lines, new_lines, counter)
	local current_new_line = new_lines[counter]

	if is_exact_match(old_lines[counter], current_new_line) then
		return "EQUAL"
	elseif is_shifted_up(old_lines[counter+1], current_new_line) then
		return "UP"
	elseif is_shifted_down(old_lines[counter-1], current_new_line) then
		return "DOWN"
	end

	return "CHANGED" 
end
