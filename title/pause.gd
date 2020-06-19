extends Control

var isPaused := false

onready var world = get_parent().get_parent()

func _input(event):
	if !world.isGameOver && !world.isWin:
		if event.is_action_pressed("ui_cancel"):
			isPaused = !isPaused
			visible = isPaused
			$title_margin/menu/bt_replay/bt.grab_focus()
			get_tree().paused = isPaused
			AudioServer.set_bus_effect_enabled(0, 0, isPaused)

func _on_replay_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _on_back_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://title/title.tscn")
