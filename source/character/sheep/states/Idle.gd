extends State

func enter(host: Node) -> void:
	pass

func update(host: Node, delta: float) -> void:
	var sheep := host as Sheep
	
	if sheep.is_predator_nearby():
		sheep.change_state("Flee")
		
	elif sheep.is_obstacle_nearby():
		sheep.change_state("Walk")
	
	elif not sheep.is_in_herd():
		sheep.change_state("Herd")
