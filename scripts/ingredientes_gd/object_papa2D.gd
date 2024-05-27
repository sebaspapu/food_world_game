extends Area2D

var gui_node_manzanas = null
var flag = false 

func _on_body_entered(body):
	if body.get_name() == "BodyProta":
		body.add_papa()
		queue_free()
