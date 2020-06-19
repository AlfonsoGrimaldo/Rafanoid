extends HBoxContainer

var index := 0

var language := ["es", "en"]

var isOptions := false
var isMute := false

func _ready():
	load_settings()

func load_settings():
	Settings.load_config()
	set_language(Settings.config_data.region.language)
	isMute = Settings.config_data.audio.mute
	update_textures_sound()
	update_textures_language()

func set_language(id):
	TranslationServer.set_locale(id)

func update_textures_sound():
	if isMute:
		$bt_sound.texture_normal = load("res://assets/ui/Button-mute.png")
		$bt_sound.texture_focused = load("res://assets/ui/Button-mute-focus.png")
	else:
		$bt_sound.texture_normal = load("res://assets/ui/Button-sound.png")
		$bt_sound.texture_focused = load("res://assets/ui/Button-sound-focus.png")

func update_textures_language():
	if index == 0:
		index += 1
		$bt_language.texture_normal = load("res://assets/ui/Button-en.png")
		$bt_language.texture_focused = load("res://assets/ui/Button-en-focus.png")
	else:
		index = 0
		$bt_language.texture_normal = load("res://assets/ui/Button-es.png")
		$bt_language.texture_focused = load("res://assets/ui/Button-es-focus.png")

func _on_bt_config_pressed():
	isOptions = !isOptions
	$bt_sound.visible = isOptions
	$bt_language.visible = isOptions

func _on_bt_sound_pressed():
	isMute = !isMute
	Settings.config_data.audio.mute = isMute
	Settings.save_config()
	update_textures_sound()

func _on_bt_language_pressed():
	update_textures_language()
	set_language(language[index])
	Settings.config_data.region.language = language[index]
	Settings.save_config()
