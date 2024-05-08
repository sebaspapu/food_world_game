extends CharacterBody2D

# ataque de bola de humo
const ATTACK = preload("res://scenes/attack_tomate.tscn")

const SPEED = 1500.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# MECANICA DE MUERTE - verificar si ha muerto
	#if Inactivo():
	#	ProcessInactivo(delta)
	#	return null
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	else:
		if $SpriteCaminandoTomate/RayColision.is_colliding():
			if  $SpriteCaminandoTomate/RaySaltar.is_colliding():
				$SpriteCaminandoTomate.scale.x = -($SpriteCaminandoTomate.scale.x)
			else:
				velocity.y = JUMP_VELOCITY
		elif not $SpriteCaminandoTomate/RayCaer.is_colliding():
			$SpriteCaminandoTomate.scale.x = -($SpriteCaminandoTomate.scale.x)
			
	velocity.x = $SpriteCaminandoTomate.scale.x * SPEED

	# verificar animaciones
	$AnimationPlayer.play("caminar")
	
	move_and_slide()
	
	# MECANICA DE ATAQUE - disparo de ajo
	if $Cadencia.is_stopped():
		if VePlayer($SpriteCaminandoTomate/RayTiro):
			$Cadencia.start(randf_range(0.1, 3)) # comentar para disparar a rafaga, tener en cuenta el Wait time de Candencia
			AttackBallsSauce()

# MECANICA DE ATAQUE - Collision con player protagonista
func VePlayer(ray):
	var col = ray.get_collider()
	if col != null:
		if col.name == "BodyProta":
			return true
	return false

# MECANICA DE ATAQUE - Disparo
func AttackBallsSauce():
	# FUNCIONA PERFECTO ATAQUE CON BOLAS DE HUMO
	var aux = ATTACK.instantiate()
	get_node("..").add_child(aux)
	aux.position = $SpriteCaminandoTomate/Mira.global_position
	aux.SetDireccion(Vector2($SpriteCaminandoTomate.scale.x, 0), true)
