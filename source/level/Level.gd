extends YSort
class_name Level

const LEVEL := "Level%d"

export var level_number := 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		next_level()


func victory() -> void:
	next_level()


func next_level() -> void:
	var next_level =  LEVEL % (level_number + 1)
	
	if Scene.has_scene(next_level):
		Scene.change(next_level, true)
	else:
		Scene.change("TitleScreen", true)


func _on_WinConditionCheckTimer_timeout() -> void:
	var safe_sheeps := 0
	
	for place in get_tree().get_nodes_in_group("SafePlace"):
		safe_sheeps += place.get_sheeps().size()
	
	if safe_sheeps == get_tree().get_nodes_in_group("Sheep").size():
		victory()
