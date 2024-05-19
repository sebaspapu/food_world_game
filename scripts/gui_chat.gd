extends Label

var textos: Array[String] = []
var caras: Array[int] = []
var caraA: Array[bool] = []
var estado: int = -1
var animation_dragon = null

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
	animation_dragon = get_tree().get_nodes_in_group("dragon_animation")[0]
	
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
		
		print("texto: ",text)
		print("cara: ",$SpriteProta.frame)
		print("estado: ", estado)
		
		if estado >= -1 and estado <= 6:
			animation_dragon.play("dormir")
			#$Luz1/Cara1.frame = caras[estado]
			$SpriteProta.frame = caras[estado]
			$SpriteProta.visible = caraA[estado]
			#$Luz2/Cara2.frame = caras[estado]
			$SpriteDragona.frame = caras[estado]
			$SpriteDragona.visible = not caraA[estado]
			#$Luz1.visible = caraA[estado]
			#$Luz2.visible = not caraA[estado]
		if (estado >= 7 and estado < 10):
			animation_dragon.play("despertando")
			$SpriteProta.frame = caras[estado]
			$SpriteProta.visible = not caraA[estado]
			$SpriteDragona.frame = caras[estado]
			$SpriteDragona.visible = not caraA[estado]
		if estado > 9:
			animation_dragon.play("dragona_activa")
			$SpriteProta.frame = caras[estado]
			$SpriteProta.visible = caraA[estado]
			$SpriteDragona.frame = caras[estado]
			$SpriteDragona.visible = not caraA[estado]
			
		$Pausa.start()
	
