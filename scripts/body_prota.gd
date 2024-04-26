extends CharacterBody2D


const SPEED = 190.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var miOrigen = Vector2(0, 0)
var raiz = null
const JUMPVEL = 300.0
var dobleJ = false

func _ready():
	raiz = get_node("..").get_node("..")
	miOrigen = position

func _physics_process(delta):
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
