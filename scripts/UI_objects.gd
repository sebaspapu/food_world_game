extends CanvasLayer

# variables ingredientes
var apple = 0
var pan = 0
var carne = 0
var lechuga = 0
var queso = 0
var papa = 0

# variables vida
var heart1
var heart2
var heart3

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
	
# carne
func handleCollectedCarne():
	print("carne: ", carne)
	carne+=1
	$NodeIngredientes/Label_contador2.text = var_to_str(carne)
	
# lechuga
func handleCollectedLechuga():
	print("lechuga: ", lechuga)
	lechuga+=1
	$NodeIngredientes/Label_contador3.text = var_to_str(lechuga)
	
# queso
func handleCollectedQueso():
	print("queso: ", queso)
	queso+=1
	$NodeIngredientes/Label_contador4.text = var_to_str(queso)

# papa
func handleCollectedPapa():
	print("papa: ", papa)
	papa+=1
	$NodeIngredientes/Label_contador5.text = var_to_str(papa)
