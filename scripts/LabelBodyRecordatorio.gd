extends Label


var body_control = null

# Called when the node enters the scene tree for the first time.
func _ready():
	body_control = get_tree().get_nodes_in_group("control_body")[0]
	body_control.get_node("LabelBodyRecordatorio").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
