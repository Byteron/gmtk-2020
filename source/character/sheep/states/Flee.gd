extends State

export var speed := 0
export var accel := 0
export var decel := 0

func enter(host: Node) -> void:
	var sheep := host as Sheep


func update(host: Node, delta: float) -> void:
	var sheep := host as Sheep
	
	var direction : Vector2
	var walk := false
	
	for node in get_tree().get_nodes_in_group("Predator"):
		
		var predator : Node2D = node
		
		if not direction:
			direction = predator.global_position.direction_to(sheep.global_position)
		else:
			direction.linear_interpolate(predator.global_position.direction_to(sheep.global_position), 0.5) 
			
		if predator.global_position.distance_to(sheep.global_position) < sheep.flee_radius:
			walk = true
	
	if walk:
		sheep.speed = clamp(sheep.speed + accel, 0, speed)
	else:
		sheep.speed = clamp(sheep.speed - decel, 0, speed)
		
	sheep.motion = direction * sheep.speed
	
	if not sheep.motion:
		sheep.change_state("Idle")
		return
	
	sheep.move()
