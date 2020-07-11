extends State

export var speed := 0
export var accel := 0
export var decel := 0


func enter(host: Node) -> void:
	var sheep := host as Sheep


func update(host: Node, delta: float) -> void:
	var sheep := host as Sheep	
	
	var direction := Vector2()
	var walk := false
	
	var obstacles = sheep.get_obstacles()
	for node in obstacles:
		
		var obstacle : Node2D = node
		
		if not direction:
			direction = obstacle.global_position.direction_to(sheep.global_position)
		else:
			direction = direction.linear_interpolate(obstacle.global_position.direction_to(sheep.global_position), 0.5)
	
	if obstacles:
		sheep.speed = clamp(sheep.speed + accel, 0, speed)
	else:
		sheep.speed = clamp(sheep.speed - decel, 0, speed)
	
	sheep.motion = direction * sheep.speed

	if sheep.is_predator_nearby():
		sheep.change_state("Flee")
		return
	
	elif not sheep.motion:
		sheep.change_state("Idle")
		return
	
	sheep.move()


func exit(host: Node) -> void:
	var sheep := host as Sheep
	sheep.motion = Vector2()
