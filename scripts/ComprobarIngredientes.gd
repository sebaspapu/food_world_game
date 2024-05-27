extends Label

var gui = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("ComprobarIngredientes").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	# Incrementar el tamaño de la nube de humo
	#growth_scale += growth_rate * $Timer.wait_time
	$Timer.start()
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("ComprobarIngredientes").visible = true
	queue_free()
