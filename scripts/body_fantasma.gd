extends CharacterBody2D


const SPEED = 1500.0
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	else:
		if $SpriteCaminandoFantasma/RayColision.is_colliding():
			if  $SpriteCaminandoFantasma/RaySaltar.is_colliding():
				$SpriteCaminandoFantasma.scale.x = -($SpriteCaminandoFantasma.scale.x)
			else:
				velocity.y = JUMP_VELOCITY
		elif not $SpriteCaminandoFantasma/RayCaer.is_colliding():
			$SpriteCaminandoFantasma.scale.x = -($SpriteCaminandoFantasma.scale.x)
			
	velocity.x = $SpriteCaminandoFantasma.scale.x * SPEED

	move_and_slide()
