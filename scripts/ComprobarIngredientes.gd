extends Label

var textos: Array[String] = []
var caras: Array[int] = []
var caraA: Array[bool] = []
var estador: int = -1

var animation_olla = null
var gui_node_plato = null
var gui_node_ingredientes = null
var label_contador6 = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Avance2()
	
func _input(event):
	if event.is_action_pressed("com_down"):
		if $Pausa.is_stopped() and estador != -1:
			Avance2()
			
func IsFree():
	return estador == -1

func AddOne2(texto: String, cara: int, isA: bool):
	textos.append(texto)
	caras.append(cara)
	caraA.append(isA)

func AddChat2(texto: Array[String], cara: Array[int], isA: Array[bool]):
	textos = texto
	caras = cara
	caraA = isA

func Clear2():
	textos = []
	caras = []
	caraA = []

func Avance2():
	animation_olla = get_tree().get_nodes_in_group("olla_animation")[0]
	label_contador6 = get_tree().get_nodes_in_group("contador_final_ingre")[0].text
	
	
	if estador == -1:
		if textos.size() > 0:
			estador = 0
	else:
		estador += 1
		if estador >= textos.size():
			estador = -1
	if estador == -1:
		visible = false
		Clear2()
	else:
		estador = 5
		visible = true
		text = textos[estador]
		
		#print("textoxd: ",text)
		#print("caraxd: ",$SpriteProta2.frame)
		print("estadorxd: ", estador)

		if (estador == 5) and (int(label_contador6) < 5.0) :
			animation_olla.play("sin_cocinar")
			$SpriteProta2.frame = caras[estador]
			$SpriteProta2.visible = not caraA[estador]
			print("entro a lo qu queria")
		
		$Pausa.start()
	
	
