extends Node

onready var anim = $AnimationPlayer

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$title_margin/menu/bt_start/bt.grab_focus()
	Save.load_game()
	$title_margin/levels.unlock_level()
	set_process_input(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if !$title_margin/menu.visible:
			set_focus_levels(false)
			anim.play("menu")

func set_focus(active):
	if active:
		$title_margin/menu/bt_levels/bt.enabled_focus_mode = Control.FOCUS_ALL
	else:
		$title_margin/menu/bt_levels/bt.enabled_focus_mode = Control.FOCUS_NONE

func set_focus_levels(active):
	var limit = Save.data.level + 1
	for i in range(1, limit):
		var bt = get_node("title_margin/levels/bt_level" + str(i) + "/bt")
		if active:
			bt.enabled_focus_mode = Control.FOCUS_ALL
		else:
			bt.enabled_focus_mode = Control.FOCUS_NONE

func _on_start_pressed():
	var num_level = str(Save.data.level)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/world" + num_level + ".tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_levels_pressed():
	set_focus(false)
	anim.play("levels")

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"levels":
			set_focus_levels(true)
			$title_margin/levels/bt_level1/bt.grab_focus()
			set_process_input(true)
		"menu":
			set_focus(true)
			$title_margin/menu/bt_start/bt.grab_focus()
			set_process_input(false)
