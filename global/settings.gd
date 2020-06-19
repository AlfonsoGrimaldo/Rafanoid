extends Node

const PATH = "user://config.cfg"

var cfg_file = ConfigFile.new()
var is_load := false

var config_data = {
	audio = {
		"mute" : false
	},
	region = {
		"language" : "es"
	}
}

func _init():
	load_config()

func save_config():
	for section in config_data.keys():
		for key in config_data[section]:
			cfg_file.set_value(str(section), str(key), config_data[section][key])
	
	cfg_file.save(PATH)

func load_config():
	var error = cfg_file.load(PATH)
	
	if error != OK:
		print("Failed loading settings file. Error code %s" % error)
		return null
	else:
		is_load = true
	
	for section in config_data.keys():
		for key in config_data[section]:
			config_data[section][key] = cfg_file.get_value(section, key, null)
