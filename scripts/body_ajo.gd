extends CharacterBody2D

const ATTACK = preload("res://scenes/attack_ajo.tscn")
const SPEED = 1500.0
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	else:
		if $SpriteCaminandoAjo/RayColision.is_colliding():
			if  $SpriteCaminandoAjo/RaySaltar.is_colliding():
				$SpriteCaminandoAjo.scale.x = -($SpriteCaminandoAjo.scale.x)
			else:
				velocity.y = JUMP_VELOCITY
		elif not $SpriteCaminandoAjo/RayCaer.is_colliding():
			$SpriteCaminandoAjo.scale.x = -($SpriteCaminandoAjo.scale.x)
			
	velocity.x = $SpriteCaminandoAjo.scale.x * SPEED
	
	# verificar animaciones
	$AnimationPlayer.play("caminar")

	move_and_slide()
	
	# disparo de ajo
	if $Cadencia.is_stopped():
		#if VePlayer($SpriteCaminandoAjo/RayTiro):
		#	$Cadencia.start(randf_range(6, 9))
			var aux = ATTACK.instantiate()
			get_node("..").add_child(aux)
			aux.position = $SpriteCaminandoAjo/Mira.global_position
			aux.SetDireccion(Vector2($SpriteCaminandoAjo.scale.x, 0), true)

func VePlayer(ray):
	var col = ray.get_collider()
	if col != null:
		if col.name == "Player":
			return true
	return false
