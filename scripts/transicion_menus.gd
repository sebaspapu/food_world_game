extends CanvasLayer

@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	layer = -1
	$AnimationPlayer.play("trans")
	
func change_scene(path : String ) -> void:
	# para poner el canvaslayer delante del juego
	layer = 1
	
	#Reproducir la animación: trans
	anim.play("trans")
	
	# iniciar animacion
	await($AnimationPlayer.animation_finished)
	
	#cambiar la escena
	get_tree().change_scene_to_file(path)
	anim.play_backwards("trans")
	
	# cuando finalice entonces debe volver a la normalidad
	await($AnimationPlayer.animation_finished)
	
	layer = -1
	
	
	
	
