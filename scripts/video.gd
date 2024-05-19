extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Button.grab_focus()

func _on_button_pressed():
	TransicionMenus.change_scene("res://scenes/food_world_introduction.tscn")
	#get_tree().change_scene_to_file("res://scenes/food_world_introduction.tscn")
