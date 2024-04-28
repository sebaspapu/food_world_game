extends CanvasLayer

var apple = 0

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
