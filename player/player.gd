extends Node2D

export (int) var speed = 450

# warning-ignore:unused_argument
func _process(delta):
	var move := Vector2()
	move.x = Input.get_action_strength("ui_right") -Input.get_action_strength("ui_left")
	
	if move.length() > 0:
		move = move.normalized() * speed
	
	position += move * delta
	position.x = clamp(position.x, 30, 260)
