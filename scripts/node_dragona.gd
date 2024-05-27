extends Node2D

@export var textos: Array[String] = []
@export var caras: Array[int] = []
@export var caraA: Array[bool] = []

var isPlayer = false
var gui = null
var animation_dragon = null

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
			
			# comprobacion de error
			var gui_node = get_node("..").get_node("GUI/GUI")
			if gui_node == null:
				print("GUI node not found")
				return

			var comprobar_ingredientes_node = gui_node.get_node("ComprobarIngredientes")
			if comprobar_ingredientes_node == null:
				print("ComprobarIngredientes node not found under GUI")
			else:
				# Aquí va el código para cuando el nodo es encontrado
				comprobar_ingredientes_node.visible = false
				
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
