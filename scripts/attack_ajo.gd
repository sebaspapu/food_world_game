extends Area2D

const SPEED = 350.0

var direccion = Vector2(0, 0)

func _process(delta):
	position += direccion * SPEED * delta
	
func SetDireccion(dir, isSmoke):
	direccion = dir.normalized()
	$SpriteHumoAjo.rotation = direccion.angle()
	$SpriteHumoAjo.visible = isSmoke
	
func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	#if body.name != "TileMap":
	#	body.Dead(false)
	#queue_free()
	pass
