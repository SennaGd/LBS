function new_backup(arguments)
	file = io.open(arguments[1]..".back", "a")
	io.input(file)
	print(io.read())
	io.close(file)
end
