extends Interactable


func _on_body_entered(node: Node) -> void:
	# print(node, (node is Sheep))
	
	if node is Sheep:
		node.queue_free()
