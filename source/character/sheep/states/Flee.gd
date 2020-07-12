extends State

export var speed := 0
export var accel := 0
export var decel := 0

func enter(host: Node) -> void:
	var sheep := host as Sheep
	sheep.anim.play("walk")
	sheep.sweat()

func update(host: Node, delta: float) -> void:
	var sheep := host as Sheep
	
	var direction : Vector2
	var walk := false
	
	for node in get_tree().get_nodes_in_group("Predator"):
		
		var predator : Node2D = node
		
		if predator.global_position.distance_to(sheep.global_position) < predator.menace:
			if not direction:
				direction = predator.global_position.direction_to(sheep.global_position)
			else:
				direction = direction.linear_interpolate(predator.global_position.direction_to(sheep.global_position), 0.5) 
			
			direction = direction.linear_interpolate(sheep.get_herd_direction(), 0.3)
			
			walk = true
	
	if walk:
		sheep.speed = clamp(sheep.speed + accel, 0, speed)
	else:
		sheep.speed = clamp(sheep.speed - decel, 0, speed)
		
	sheep.motion = direction * sheep.orientation * sheep.speed
	
	if not sheep.motion:
		sheep.change_state("Idle")
		return
	
	sheep.move()
