extends Node

const SAVE_DIR = "user://saves/"
var save_path = SAVE_DIR + "save.sav"

var level := 1

var data = {
	"level" : 1
}

func save_game():
	var dir = Directory.new()
	
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	file.open(save_path, File.WRITE)
	
	var save_data = data
	
	save_data.level = level
	
	file.store_line(to_json(save_data))
	file.close()

func load_game():
	var loading = File.new()
	
	if !loading.file_exists(save_path):
		return
	
	loading.open(save_path, File.READ)
	
	var load_data = data
	
	if !loading.eof_reached():
		var provis_fact = parse_json(loading.get_line())
		if provis_fact != null:
			load_data = provis_fact
	
	loading.close()
	
	level = load_data.level
