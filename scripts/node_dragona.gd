extends Node2D

@export var textos: Array[String] = []
@export var caras: Array[int] = []
@export var caraA: Array[bool] = []

var isPlayer = false
var gui = null
var animation_dragon = null

# durmiendo
var duerme = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.play("dormir")
	animation_dragon = get_tree().get_nodes_in_group("dragon_animation")[0]
	animation_dragon.play("dormir")
	
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("Interactuar").visible = false

func _input(event):
	if event.is_action_pressed("com_down"):
		if isPlayer:
			var chat = gui.get_node("Chat")
			gui.get_node("Interactuar").visible = false
			if chat.IsFree():
				chat.AddChat(textos, caras, caraA)
				chat.Avance()


func _on_area_2d_body_entered(body):
	if body.name == "BodyProta":
		isPlayer = true
		gui.get_node("Interactuar").visible = true


func _on_area_2d_body_exited(body):
	if body.name == "BodyProta":
		isPlayer = false
		gui.get_node("Interactuar").visible = false


func _on_giro_timeout():
	for p in get_tree().get_nodes_in_group("player"):
		if p.position.x < position.x:
			$SpriteDragona.scale.x = 0.2
		else:
			$SpriteDragona.scale.x = -0.2
