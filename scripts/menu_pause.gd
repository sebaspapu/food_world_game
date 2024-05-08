extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$ColorRect/ColorRect2/ButtonReanudar.grab_focus()

func _input(event):
	if event.is_action_pressed("escape"):
		op_event(true)
		#get_tree().set_pause(!get_tree().paused)

func _on_button_reanudar_pressed():
	op_event(true)

func _on_button_menu_pressed():
	op_event(false)
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func op_event(condic):
	if condic:
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused
	else:
		get_tree().paused = not get_tree().paused
