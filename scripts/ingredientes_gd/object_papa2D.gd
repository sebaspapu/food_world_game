extends Area2D

func _on_body_entered(body):
	if body.get_name() == "BodyProta":
		body.add_papa()
		queue_free()
