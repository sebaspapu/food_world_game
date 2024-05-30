extends Node2D

var gui_node_manzanas = null
var gui_node_ingredientes = null
var gui_node_vidas = null
var gui_node_comprobar = null

var gui = null
var gui2 = null
var gui_node_plato = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	gui_node_manzanas = get_tree().get_nodes_in_group("node_manzanas")[0]
	gui_node_manzanas.visible = false
	
	gui_node_ingredientes = get_tree().get_nodes_in_group("node_ingredientes")[0]
	gui_node_ingredientes.visible = false
	
	gui_node_vidas = get_tree().get_nodes_in_group("node_vidas")[0]
	gui_node_vidas.visible = true
	
	
	# --->> HAY QUE CAMBIARLO POR LA SEGUNDA VERSION DE COMPROBAR INGREDIENTES
	gui = get_tree().get_nodes_in_group("gui")[0]
	gui.get_node("ComprobarIngredientes").visible = false
	
	gui2 = get_tree().get_nodes_in_group("gui")[0]
	gui2.get_node("Node2D").visible = false
	
	gui_node_plato = get_tree().get_nodes_in_group("node_plato")[0]
	gui_node_plato.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
