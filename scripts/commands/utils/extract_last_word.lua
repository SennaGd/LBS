function fetch_last_word(filepath)
	for s_word in filepath:gmatch"[^/,\r\n]+" do
		if s_word ~= nil then
			last_word = s_word
		end
	end
return last_word end
