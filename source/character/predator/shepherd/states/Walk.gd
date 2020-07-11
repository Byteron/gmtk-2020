extends State

export var speed := 350


func enter(host: Node) -> void:
	var shepherd := host as Shepherd


func update(host: Node, delta: float) -> void:
	var shepherd := host as Shepherd
	
	shepherd.motion = shepherd.get_input_direction() * shepherd.orientation * speed

	if not shepherd.motion:
		shepherd.change_state("Idle")
		return
	
	shepherd.move()


func exit(host: Node) -> void:
	var shepherd := host as Shepherd
	
	shepherd.motion = Vector2()
