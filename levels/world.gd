extends Node

signal start_game

export (int) var level

var isStart := false
var isWin := false
var isGameOver := false

func _ready():
	Settings.load_config()
	set_mute()
	AudioServer.set_bus_effect_enabled(0, 0, false)
	get_tree().paused = false
# warning-ignore:return_value_discarded
	connect("start_game", $ball, "start_ball")
# warning-ignore:return_value_discarded

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		if !isStart:
			$start.play()
			$CanvasLayer/Label.hide()
			$player/RemoteT.queue_free()
			emit_signal("start_game")
			isStart = true

func set_mute():
	AudioServer.set_bus_mute(0, Settings.config_data.audio.mute)
