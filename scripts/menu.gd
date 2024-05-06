extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ButtonIniciar.grab_focus()

func _on_button_iniciar_pressed():
	#get_tree().change_scene_to_file("res://scenes/food_world.tscn")
	get_tree().change_scene_to_file("res://scenes/video.tscn")
	

func _on_button_salir_pressed():
	get_tree().quit()
