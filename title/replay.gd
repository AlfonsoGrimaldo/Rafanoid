extends Node

func _ready():
	$title_margin/menu/bt_replay/bt.grab_focus()
	$lose.play()

func _on_replay_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://title/title.tscn")

func _on_quit_pressed():
	get_tree().quit()
