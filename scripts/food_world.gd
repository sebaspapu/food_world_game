extends Node2D

var gui = null
var gui_node_plato = null
var gui_dragon = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("Node2D").visible = false
	
	gui_node_plato = get_tree().get_nodes_in_group("node_plato")[0]
	gui_node_plato.visible = false
	
	gui_dragon = get_tree().get_nodes_in_group("node_dragona_sleep")[0]
	gui_dragon.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
