extends Area2D

const SPEED = 400.0

var direccion = Vector2(0, 0)

func _process(delta):
	position += direccion * SPEED * delta

func SetDireccion(dir):
	direccion = dir.normalized()
	$SpriteAtaque.rotation = direccion.angle()

func _on_fin_timeout():
	queue_free()

func _on_body_entered(body):
	if body.name != "TileMap":
		body.Dead(false)
	queue_free()
