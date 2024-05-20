extends Label

var gui = null

# Called when the node enters the scene tree for the first time.
func _ready():
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("ComprobarIngredientes").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
