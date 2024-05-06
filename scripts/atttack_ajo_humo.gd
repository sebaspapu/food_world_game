extends Area2D


var growth_scale = 0.038  # Factor de escala inicial
var growth_rate = 0.2  # Tasa de crecimiento por segundo

func _ready():
	$Timer.start()

func _on_timer_timeout():
	# Incrementar el tamaño de la nube de humo
	growth_scale += growth_rate * $Timer.wait_time
	$AnimationPlayer.play("expansion_humo")
	print("growth_scale: ",growth_scale)
	
	# Reanudar el temporizador si la nube aún no ha alcanzado el tamaño deseado
	if growth_scale < 0.9:
		$Timer.start()
	else:
		# Si la nube alcanza el tamaño máximo, destruir el ataque
		queue_free()

func _on_body_entered(body):
	if body.name != "TileMap":
		body.Dead(false)

	queue_free()
