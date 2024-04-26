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
		if $SpriteCaminandoAjo/RayColision.is_colliding():
			if  $SpriteCaminandoAjo/RaySaltar.is_colliding():
				$SpriteCaminandoAjo.scale.x = -($SpriteCaminandoAjo.scale.x)
			else:
				velocity.y = JUMP_VELOCITY
		elif not $SpriteCaminandoAjo/RayCaer.is_colliding():
			$SpriteCaminandoAjo.scale.x = -($SpriteCaminandoAjo.scale.x)
			
	velocity.x = $SpriteCaminandoAjo.scale.x * SPEED

	move_and_slide()
