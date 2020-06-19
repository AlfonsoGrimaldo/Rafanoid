extends Node

onready var world = get_parent()

func _ready():
	Save.load_game()
	$win.play()
	if world.level == 5:
		$title_margin/menu/bt_back/bt.grab_focus()
		$title_margin/menu/bt_next.hide()
	else:
		$title_margin/menu/bt_next/bt.grab_focus()
		next_level()

func _on_next_pressed():
	var num_level = str(Save.level)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world" + num_level + ".tscn")

func _on_back_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://title/title.tscn")

func next_level():
	if Save.level == world.level:
		Save.level += 1
		Save.save_game()
