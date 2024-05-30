extends Label

var textos: Array[String] = []
var caras: Array[int] = []
var caraA: Array[bool] = []
var estado_x: int = -1
var animation_dragon = null
var flag_transformation = false
var retorno = false
var flag_first = false

var label_contador_plato = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Avance(false)
	
func _input(event):
	if event.is_action_pressed("com_down"):
		print("print antes de estado y despues de shift: ", estado_x)
		if $Pausa.is_stopped() and estado_x != -1:
			Avance(false)
		
func IsFree():
	return estado_x == -1

func AddOne(texto: String, cara: int, isA: bool):
	textos.append(texto)
	caras.append(cara)
	caraA.append(isA)

func AddChat(texto: Array[String], cara: Array[int], isA: Array[bool]):
	textos = texto
	caras = cara
	caraA = isA

func Clear():
	textos = []
	caras = []
	caraA = []


func Avance(flag_avance):
	animation_dragon = get_tree().get_nodes_in_group("dragon_animation")[0]
	label_contador_plato = get_tree().get_nodes_in_group("label_contador_plato_definitivo")[0].text
	print("label_contador_plato: ", label_contador_plato)
	
	if estado_x == -1:
		if textos.size() > 0:
			estado_x = 0
	else:
		estado_x += 1
		if estado_x >= textos.size():
			estado_x = -1
	if estado_x == -1:
		visible = false
		Clear()
	else:
		
		print("estado: ", estado_x)	
		if int(label_contador_plato) == 1 and not flag_first:
			estado_x = 2
			flag_first = true
		if (estado_x >= -1 and estado_x <= 1) and (int(label_contador_plato) < 1):
			print("entonces aqui entra")
			
			visible = true
			text = textos[estado_x]
			
			print("texto op: ",text)
			print("cara op: ",$SpriteProta.frame)
			print("estado_x op: ", estado_x)
			print("retorno op: ", retorno)
			print("label_contador_plato dentro op: ", label_contador_plato)
			
		
			animation_dragon.play("dragona_activa")
			$SpriteProta.frame = caras[estado_x]
			$SpriteProta.visible = caraA[estado_x]
			$SpriteDragona.frame = caras[estado_x]
			$SpriteDragona.visible = not caraA[estado_x]
			retorno = true
			
		elif (estado_x >= 2 and estado_x <= 22) and (int(label_contador_plato) == 1):
			print("esta entrando?")
			
			visible = true
			text = textos[estado_x]
			
			print("texto op: ",text)
			print("cara op: ",$SpriteProta.frame)
			print("estado_x op: ", estado_x)
			print("retorno op: ", retorno)
			print("label_contador_plato dentro op: ", label_contador_plato)
			
			animation_dragon.play("dragona_activa")
			$SpriteProta.frame = caras[estado_x]
			$SpriteProta.visible = caraA[estado_x]
			$SpriteDragona.frame = caras[estado_x]
			$SpriteDragona.visible = not caraA[estado_x]
			
			retorno = false
			
		elif (estado_x == 23) and (int(label_contador_plato) == 1):
			TransicionMenus.change_scene("res://scenes/game_over.tscn")
		else:
			animation_dragon.play("dragona_activa")
			retorno = false
			estado_x = 23
			
		$Pausa.start()
	return retorno
