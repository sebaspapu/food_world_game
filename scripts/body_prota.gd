extends CharacterBody2D

const BALA = preload("res://Scenes/attack_prota.tscn")

const SPEED = 190.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var miOrigen = Vector2(0, 0)
var raiz = null
const JUMPVEL = 300.0
var dobleJ = false

var isdead = false

func _ready():
	raiz = get_node("..").get_node("..")
	miOrigen = position

func _physics_process(delta):
	
	# verificar si ha muerto
	if Inactivo():
		ProcessInactivo(delta)
		return null
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		dobleJ = true
	# salto
	if Input.is_action_just_pressed("com_jump"):
		if is_on_floor():
			velocity.y = -JUMPVEL
		elif dobleJ:
			dobleJ = false
			velocity.y = -JUMPVEL

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# verificar si cayo
	if position.y > 635:
		position = miOrigen
		$AnimationPlayer.play("inactivo")

	move_and_slide()
	
	# disparar
	if Input.is_action_pressed("com_disparo"):
		if $Cadencia.is_stopped():
			$Cadencia.start()
			var aux = BALA.instantiate()
			get_node("..").add_child(aux)
			aux.position = $SpriteCaminandoProta/Mira.global_position
			aux.SetDireccion(Vector2($SpriteCaminandoProta.scale.x, 0))
	
# se detiene el personaje prota
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
		var pos = $Camara.global_position
		var c = $Camara
		remove_child(c)
		get_node("..").add_child(c)
		c.position_smoothing_enabled = false
		c.position = pos
		queue_free()
	else:
		collision_layer = 0
		#$Anima.play("dead")
		velocity.x = 0
		isdead = true
		
func Inactivo():
	return isdead == true		