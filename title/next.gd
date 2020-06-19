extends Node

func _ready():
	$title_margin/menu/bt_next/bt.grab_focus()
	Save.load_game()
	$win.play()
	if Save.data.level == 5:
		$title_margin/menu/bt_next.hide()

func _on_next_pressed():
	var num_level = str(Save.data.level)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world" + num_level + ".tscn")

func _on_back_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://title/title.tscn")
