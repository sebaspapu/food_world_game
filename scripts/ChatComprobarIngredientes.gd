extends Label

var textos: Array[String] = []
var caras: Array[int] = []
var caraA: Array[bool] = []
var estador: int = -1

var animation_olla = null
var gui_node_plato = null
var gui_node_ingredientes = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Avance()
	
func _input(event):
	if event.is_action_pressed("com_down"):
		if $Pausa.is_stopped() and estador != -1:
			Avance()
			
func IsFree():
	return estador == -1

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

func Avance():
	animation_olla = get_tree().get_nodes_in_group("olla_animation")[0]
	
	if estador == -1:
		if textos.size() > 0:
			estador = 0
	else:
		estador += 1
		if estador >= textos.size():
			estador = -1
	if estador == -1:
		visible = false
		Clear()
	else:
		visible = true
		if estador != 5:
			text = textos[estador]
		
		print("texto: ",text)
		print("cara: ",$SpriteProta3.frame)
		print("estador: ", estador)
		
		if estador == 0:
			animation_olla.play("sin_cocinar")
			$SpriteProta3.frame = caras[estador]
			$SpriteProta3.visible = caraA[estador]
		elif estador >= 1 and estador <= 3:
			animation_olla.play("cocinando")
			$SpriteProta3.frame = caras[estador]
			$SpriteProta3.visible = not caraA[estador]
		elif estador == 4:
			animation_olla.play("sin_cocinar")
			$SpriteProta3.frame = caras[estador]
			$SpriteProta3.visible = caraA[estador]
			gui_node_ingredientes = get_tree().get_nodes_in_group("node_ingredientes")[0]
			gui_node_ingredientes.visible = false
			gui_node_plato = get_tree().get_nodes_in_group("node_plato")[0]
			gui_node_plato.visible = true
		elif estador == 5:
			animation_olla.play("sin_cocinar")
		#else:
		#	animation_olla.play("sin_cocinar")
		#	$SpriteProta3.frame = caras[estador]
		#	$SpriteProta3.visible = caraA[estador]
		
		$Pausa.start()
	
