extends Node2D

var gui_node_manzanas = null
var gui_node_ingredientes = null
var gui_node_vidas = null
var gui_node_comprobar = null

var gui = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	gui_node_manzanas = get_tree().get_nodes_in_group("node_manzanas")[0]
	gui_node_manzanas.visible = false
	
	gui_node_ingredientes = get_tree().get_nodes_in_group("node_ingredientes")[0]
	gui_node_ingredientes.visible = false
	
	gui_node_vidas = get_tree().get_nodes_in_group("node_vidas")[0]
	gui_node_vidas.visible = true
	
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("ComprobarIngredientes").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
