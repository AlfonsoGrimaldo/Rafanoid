extends RigidBody2D

var replay = load("res://title/replay.tscn").instance()
var next = load("res://title/next.tscn").instance()

export (Vector2) var velocity

func start_ball():
	yield(get_tree().create_timer(0.1), "timeout")
	mode = RigidBody2D.MODE_RIGID
	apply_impulse(Vector2.ZERO, velocity)

# warning-ignore:unused_argument
func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("blocks"):
			body.queue_free()
			$break.play()
			if body.get_parent().get_child_count() == 1:
				get_parent().isWin = true
				queue_free()
				create_next()
		else:
			$hit.play()

func create_replay():
	get_parent().add_child(replay)
	get_tree().paused = true
	get_parent().get_node("background").stop()

func create_next():
	get_parent().add_child(next)
	get_tree().paused = true
	get_parent().get_node("background").stop()
	if Save.data.level != 5:
		Save.data.level += 1
		Save.save_game()
