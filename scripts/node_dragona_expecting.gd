extends Node2D

@export var textos: Array[String] = []
@export var caras: Array[int] = []
@export var caraA: Array[bool] = []

var isPlayer = false
var gui = null
var animation_dragon = null
var flag = null


# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.play("dormir")
	animation_dragon = get_tree().get_nodes_in_group("dragon_animation_expecting")[0]
	animation_dragon.play("dragona_activa")
	
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("Interactuar2").visible = false

func _input(event):
	if event.is_action_pressed("com_shift"):
		#if not flag:
		if isPlayer:
			print("es draExpecting...")
			var chat = gui.get_node("ChatDragonaExpecting")
			gui.get_node("Interactuar2").visible = false
			if chat.IsFree():
				chat.AddChat(textos, caras, caraA)
				var flag_avance = chat.Avance(false)
				print("flag_avance: ", flag_avance)
				flag = flag_avance
				print("chat de avance ChatDragonaExpecting \n")

func _on_area_2d_body_entered(body):
	if body.name == "BodyProta":
		isPlayer = true
		gui.get_node("Interactuar2").visible = true


func _on_area_2d_body_exited(body):
	if body.name == "BodyProta":
		isPlayer = false
		gui.get_node("Interactuar2").visible = false


func _on_giro_timeout():
	for p in get_tree().get_nodes_in_group("player"):
		if p.position.x < position.x:
			$SpriteDragonaExpecting.scale.x = 0.2
		else:
			$SpriteDragonaExpecting.scale.x = -0.2
