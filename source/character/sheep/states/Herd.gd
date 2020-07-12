extends State

export var speed := 0
export var accel := 0
export var decel := 0


func enter(host: Node) -> void:
	var sheep := host as Sheep
	sheep.anim.play("walk")


func update(host: Node, delta: float) -> void:
	var sheep := host as Sheep	
	
	var direction := sheep.get_herd_direction()
	
	sheep.motion = direction * sheep.orientation * speed
	
	# print(sheep.motion)
	
	if sheep.is_predator_nearby():
		sheep.change_state("Flee")
	elif sheep.is_in_herd():
		sheep.change_state("Idle")
	elif not sheep.motion:
		sheep.change_state("Idle")
	
	else:
		sheep.move()


func exit(host: Node) -> void:
	var sheep := host as Sheep
	sheep.motion = Vector2()
