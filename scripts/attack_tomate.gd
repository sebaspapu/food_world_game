extends Area2D

const SPEED = 100.0

var direccion = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direccion * SPEED * delta

func SetDireccion(dir, isSauce):
	direccion = dir.normalized()
	$SpriteAtaqueTomate.rotation = direccion.angle()
	$SpriteAtaqueTomate.visible = isSauce
	$AnimationPlayer.play("salseo")

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.name != "TileMap":
		body.Dead(false)

	queue_free()
