extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ButtonMenu.grab_focus()

func _on_button_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
