extends CanvasLayer

var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#var appleNode = get_tree().get_root().find_node("object_manzana2D",true,false)
	#appleNode.connect("appleCollected",self,"handleAppleCollected")
	
	# para tomar una sola manzana
	#var appleNode = get_parent().find_child("object_manzana2D")
	#appleNode.connect("appleCollected",handleAppleCollected)
	
	$Label_contador.text = var_to_str(coins)

func handleAppleCollected():
	print("coins: ", coins)
	coins+=1 # coins = coins + 1
	$Label_contador.text = var_to_str(coins)
