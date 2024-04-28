extends Area2D

signal appleCollected

func _on_body_entered(body):
	if body.get_name() == "BodyProta":
		
		body.add_apple()
		
		# tomar una sola manzana
		#emit_signal("appleCollected")
		queue_free()
		pass # Replace with function body.
