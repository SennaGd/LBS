-- Adds content (i.e. files/folders) to .back file
function c_add(arguments)
	local check = io.open(arguments[1]..".back", "r")
	if not check then
		print("File '"..arguments[1]..".back' does not exist")
		return 	
	end

	for i = 2, #arguments do
		local file = io.open(arguments[1] ..".back", "a")	
		local path = ""

		if string.sub(arguments[i], -1) == "/" then
			path = "FOLDER "..arguments[i].."\n"
		else
			path = "FILE "..arguments[i].."\n"
		end

		io.input(file)
		file:write(path)
		file:close()

		print("Added '"..arguments[i].."' to '"..arguments[1]..".back'")

	end
end
