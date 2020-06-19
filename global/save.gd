extends Node

const SAVE_DIR = "user://saves/"

var path = SAVE_DIR + "save.dat"

var data = {
	"level" : 1
}

func save_game():
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(path, File.WRITE, "1234")
	if error == OK:
		file.store_var(data)
		file.close()

func load_game():
	var file = File.new()
	
	if file.file_exists(path):
		var error = file.open_encrypted_with_pass(path, File.READ, "1234")
		if error == OK:
			data = file.get_var()
			file.close()
