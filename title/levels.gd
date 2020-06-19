extends VBoxContainer

func unlock_level():
	var limit = Save.level + 1
	for i in range(2, limit):
		get_node("bt_level" + str(i) + "/bt").disabled = false
		get_node("bt_level" + str(i) + "/bt").focus_mode = Control.FOCUS_ALL

func _on_level1_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world1.tscn")

func _on_level2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world2.tscn")

func _on_level3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world3.tscn")

func _on_level4_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world4.tscn")

func _on_level5_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world5.tscn")
