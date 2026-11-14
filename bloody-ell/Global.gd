extends Node

var player = null
var node_creation_parent = null

func get_instance_node(node, location, parent):
	var node_instance = node. instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
