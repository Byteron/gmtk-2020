extends Interactable


func _on_body_entered(node: Node) -> void:

	if node is Sheep:
		node.drown()
