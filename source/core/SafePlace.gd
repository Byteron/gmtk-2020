extends Area2D


func get_sheeps() -> Array:
	var sheeps := []
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("Sheep"):
			sheeps.append(body)
	
	return sheeps
