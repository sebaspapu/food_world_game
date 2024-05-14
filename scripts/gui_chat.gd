extends Label

var textos: Array[String] = []
var caras: Array[int] = []
var caraA: Array[bool] = []
var estado: int = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	Avance()
	
func _input(event):
	if event.is_action_pressed("com_down"):
		if $Pausa.is_stopped() and estado != -1:
			Avance()
		
func IsFree():
	return estado == -1

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
	if estado == -1:
		if textos.size() > 0:
			estado = 0
	else:
		estado += 1
		if estado >= textos.size():
			estado = -1
	if estado == -1:
		visible = false
		Clear()
	else:
		visible = true
		text = textos[estado]
		#$Luz1/Cara1.frame = caras[estado]
		$SpriteProta.frame = caras[estado]
		#$Luz2/Cara2.frame = caras[estado]
		$SpriteDragona.frame = caras[estado]
		#$Luz1.visible = caraA[estado]
		#$Luz2.visible = not caraA[estado]
		$Pausa.start()
