extends State

export var speed := 350


func enter(host: Node) -> void:
	var player := host as Player


func update(host: Node, delta: float) -> void:
	var player := host as Player
	
	player.motion = player.get_input_direction() * speed

	if not player.motion:
		player.change_state("Idle")
		return
	
	player.move()


func exit(host: Node) -> void:
	var player := host as Player
	
	player.motion = Vector2()
