function new_backup(arguments)
	print("creating new backup file called: "..arguments[1]..".back")
	file = io.open(arguments[1]..".back", "r")
	io.input(file)
	print(io.read())
	io.close(file)
end
return new_backup
