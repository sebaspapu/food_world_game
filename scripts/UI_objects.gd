extends CanvasLayer

# variables ingredientes
var apple = 0
var pan = 0
var carne = 0
var lechuga = 0
var queso = 0
var papa = 0
var contador_ingredientes = 0


# variables vida
var heart1
var heart2
var heart3

# aparecer recordatorio
var body_control = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# asignacion sprites
	heart1 = get_node("NodeVidas/SpriteVidas")
	heart2 = get_node("NodeVidas/SpriteVidas2")
	heart3 = get_node("NodeVidas/SpriteVidas3")

	# ---- para tomar una sola manzana ---
	# forma anterior:
	#var appleNode = get_tree().get_root().find_node("object_manzana2D",true,false)
	#appleNode.connect("appleCollected",self,"handleAppleCollected")
	# actual forma para esta version:
	#var appleNode = get_parent().find_child("object_manzana2D")
	#appleNode.connect("appleCollected",handleAppleCollected)
	
	# ---- para mostrar contador manzanas ----
	$NodeManzanas/Label_contador.text = var_to_str(apple)

func handleAppleCollected():
	print("apple: ", apple)
	apple+=1 # coins = coins + 1
	$NodeManzanas/Label_contador.text = var_to_str(apple)
	
func handleHearts(lifes):
	
	if lifes == 0:
		heart1.visible = false
	if lifes == 1:
		heart2.visible = false
	if lifes == 2:
		heart3.visible = false

# contadores de ingredientes

# pan
func handleCollectedPan():
	print("panes: ", pan)
	pan+=1
	$NodeIngredientes/Label_contador.text = var_to_str(pan)
	fun_contador_ingredientes(pan,0,0,0,0)
	
# carne
func handleCollectedCarne():
	print("carne: ", carne)
	carne+=1
	$NodeIngredientes/Label_contador2.text = var_to_str(carne)
	fun_contador_ingredientes(0,carne,0,0,0)
	
# lechuga
func handleCollectedLechuga():
	print("lechuga: ", lechuga)
	lechuga+=1
	$NodeIngredientes/Label_contador3.text = var_to_str(lechuga)
	fun_contador_ingredientes(0,0,lechuga,0,0)
	
# queso
func handleCollectedQueso():
	print("queso: ", queso)
	queso+=1
	$NodeIngredientes/Label_contador4.text = var_to_str(queso)
	fun_contador_ingredientes(0,0,0,queso,0)

# papa
func handleCollectedPapa():
	print("papa1: ", papa)
	papa+=1
	$NodeIngredientes/Label_contador5.text = var_to_str(papa)
	fun_contador_ingredientes(0,0,0,0,papa)

func fun_contador_ingredientes(pan, carne, lechuga, queso, papa):
	#contador_ingredientes += pan + carne + lechuga + queso + papa
	
	var con_papa = 0
	var con_pan = 0
	var con_carne = 0
	var con_lechuga = 0
	var con_queso = 0
	
	if papa:
		con_papa =+ 1
	elif pan:
		con_pan =+ 1
	elif carne:
		con_carne =+ 1
	elif lechuga:
		con_lechuga =+ 1
	elif queso:
		con_queso =+ 1
	contador_ingredientes = contador_ingredientes + con_papa + con_pan + con_carne + con_lechuga + con_queso
	
	print("contador_ingredientes: ", contador_ingredientes)
	$NodeIngredientes/Label_contador6.text = var_to_str(contador_ingredientes)
	#return contador_ingredientes
	if contador_ingredientes == 5:
		body_control = get_tree().get_nodes_in_group("control_body")[0]
		body_control.get_node("LabelBodyRecordatorio").visible = true
		$NodePlato/Label_contador.text = var_to_str(1)
