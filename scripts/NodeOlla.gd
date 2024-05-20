extends Node2D

@export var textos: Array[String] = []
@export var caras: Array[int] = []
@export var caraA: Array[bool] = []

var isPlayer = false
var gui = null
var animation_olla = null

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_olla = get_tree().get_nodes_in_group("olla_animation")[0]
	animation_olla.play("sin_cocinar")
	
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("Interactuar").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("com_down"):
		if isPlayer:
			var chat = gui.get_node("ChatComprobarIngredientes")
			gui.get_node("Interactuar").visible = false
			if chat.IsFree():
				chat.AddChat(textos, caras, caraA)
				chat.Avance()


func _on_giro_timeout():
	for p in get_tree().get_nodes_in_group("player"):
		if p.position.x < position.x:
			$SpriteOlla.scale.x = 0.5
		else:
			$SpriteOlla.scale.x = -0.5


func _on_area_2d_body_entered(body):
	if body.name == "BodyProta":
		isPlayer = true
		gui.get_node("Interactuar").visible = true


func _on_area_2d_body_exited(body):
	if body.name == "BodyProta":
		isPlayer = false
		gui.get_node("Interactuar").visible = false
