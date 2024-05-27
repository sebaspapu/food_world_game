extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	# Incrementar el tamaño de la nube de humo
	#growth_scale += growth_rate * $Timer.wait_time
	$Timer.start()
	queue_free()
