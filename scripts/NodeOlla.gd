extends Node2D

@export var textos: Array[String] = []
@export var caras: Array[int] = []
@export var caraA: Array[bool] = []

var isPlayer = false
var gui = null
var gui2 = null
var animation_olla = null
var label_contador6 = null
var flag = false
var flag_comida = false
var body_control = null

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_olla = get_tree().get_nodes_in_group("olla_animation")[0]
	animation_olla.play("sin_cocinar")
	
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("Interactuar").visible = false
	
	$Label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	label_contador6 = get_tree().get_nodes_in_group("contador_final_ingre")[0].text
	if event.is_action_pressed("com_down"):
		flag = true
		print("label_contador6x: ", label_contador6)
		if int(label_contador6) >= 5.0 and (not flag_comida):
			print("tienes los ingredientes")
			if isPlayer:
				var chat = gui.get_node("ChatComprobarIngredientes")
				gui.get_node("Interactuar").visible = false
				if chat.IsFree():
					chat.AddChat(textos, caras, caraA)
					chat.Avance()
					flag_comida = true
					$Label.text = var_to_str(1)
					$Label.visible = true
					body_control = get_tree().get_nodes_in_group("control_body")[0]
					body_control.get_node("LabelBodyRecordatorio").visible = false
					
		elif int(label_contador6) < 5.0:
			print("entra a la condicion")
			if isPlayer:
				#gui2 = get_tree().get_nodes_in_group("gui")[0]
				var chat2 = gui.get_node("ComprobarIngredientes")#.visible = true
				gui.get_node("Interactuar").visible = false
				if chat2.IsFree():
					chat2.AddChat2(textos, caras, caraA)
					chat2.Avance2()
				print("entro aca")
			
		print("se salio")
			
			# --->> HAY QUE CAMBIARLO POR LA SEGUNDA VERSION DE COMPROBAR INGREDIENTES
			
			#var gui_node = get_node("..").get_node("GUI/GUI")
			#if gui_node == null:
			#	print("GUI node not found")
			#	return

			#var comprobar_ingredientes_node = gui_node.get_node("ComprobarIngredientes")
			#if comprobar_ingredientes_node == null:
			#	print("ComprobarIngredientes node not found under GUI")
			#else:
				# Aquí va el código para cuando el nodo es encontrado
			#	gui.get_node("Interactuar").visible = false
			#	comprobar_ingredientes_node.visible = true


func _on_giro_timeout():
	for p in get_tree().get_nodes_in_group("player"):
		if p.position.x < position.x:
			$SpriteOlla.scale.x = 0.5
		else:
			$SpriteOlla.scale.x = -0.5


func _on_area_2d_body_entered(body):
	if body.name == "BodyProta":
		isPlayer = true
		label_contador6 = get_tree().get_nodes_in_group("contador_final_ingre")[0].text
		#if ((not flag) or (int(label_contador6) >= 5.0)) and (not flag_comida):
		if not flag_comida:#int(label_contador6) <= 5.0:
			gui.get_node("Interactuar").visible = true


func _on_area_2d_body_exited(body):
	if body.name == "BodyProta":
		isPlayer = false
		gui.get_node("Interactuar").visible = false
