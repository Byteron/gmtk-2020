extends State

func enter(host: Node) -> void:
	var player := host as Player


func input(host: Node, event: InputEvent) -> void:
	var player := host as Player
	
	if player.get_input_direction():
		player.change_state("Walk")
