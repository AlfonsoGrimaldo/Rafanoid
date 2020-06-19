extends Area2D

func _on_death_zone_body_entered(body):
	if body.is_in_group("ball"):
		body.queue_free()
		get_parent().isGameOver = true
		body.create_replay()
