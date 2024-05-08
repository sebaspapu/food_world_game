extends CharacterBody2D

# ataque de bola de humo
const ATTACK = preload("res://scenes/attack_ajo.tscn")

# ataque humo
const ATTACK_SMOKE = preload("res://scenes/atttack_ajo_humo.tscn")

const SPEED = 1500.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	# MECANICA DE MUERTE - verificar si ha muerto
	if Inactivo():
		ProcessInactivo(delta)
		return null
	
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
		if VePlayer($SpriteCaminandoAjo/RayTiro):
			$Cadencia.start(randf_range(0.1, 0.5)) # comentar para disparar a rafaga, tener en cuenta el Wait time de Candencia
			AttackBallsSmoke()
			AttackSmoke()

func VePlayer(ray):
	var col = ray.get_collider()
	if col != null:
		if col.name == "BodyProta":
			return true
	return false

# verificando si el ataque del prota fue efectivo
func ProcessInactivo(delta):
	# caida y frenazo
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity.x = move_toward(velocity.x, 0, SPEED)
	# ejecucion fisica final
	move_and_slide()
	# verificar si cayo
	if position.y > 1155:
		Dead(true)

func Dead(delete):
	if delete:
		queue_free()
	else:
		collision_layer = 0
		collision_mask = 0
		$AnimationPlayer.play("muerte")
		velocity.y = JUMP_VELOCITY

func Inactivo():
	return $AnimationPlayer.current_animation == "muerte"

func AttackSmoke():
	# FUNCIONA ATAQUE HUMO
	var attackInstance = ATTACK_SMOKE.instantiate()  # Instancia del ataque
	get_node("..").add_child(attackInstance)  # Añadir ataque como hijo
	attackInstance.position = $SpriteCaminandoAjo/Mira.global_position  # Posición del ataque

func AttackBallsSmoke():
	# FUNCIONA PERFECTO ATAQUE CON BOLAS DE HUMO
	var aux = ATTACK.instantiate()
	get_node("..").add_child(aux)
	aux.position = $SpriteCaminandoAjo/Mira.global_position
	aux.SetDireccion(Vector2($SpriteCaminandoAjo.scale.x, 0), true)
