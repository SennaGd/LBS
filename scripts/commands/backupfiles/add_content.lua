-- Adds content (i.e. files/folders) to .back file
function c_add(arguments)
	local check = io.open(arguments[1]..".back", "r")
	if check then
		local file = io.open(arguments[1]..".back", "a")	
		io.input(file)
		file:write(arguments[2])

		print("Added '"..arguments[2].."' to '"..arguments[1]..".back'")


		file:close()
	else
		print("File '"..arguments[1].."' does not exist")
	end
end
