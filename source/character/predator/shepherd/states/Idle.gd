extends State


func enter(host: Node) -> void:
	var shepherd := host as Shepherd


func input(host: Node, event: InputEvent) -> void:
	var shepherd := host as Shepherd
	
	if shepherd.get_input_direction():
		shepherd.change_state("Walk")
