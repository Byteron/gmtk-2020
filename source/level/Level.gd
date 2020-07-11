extends YSort
class_name Level

const LEVEL := "Level%d"

export var level_number := 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		next_level()


func next_level() -> void:
	var next_level =  LEVEL % (level_number + 1)
	
	if Scene.has_scene(next_level):
		Scene.change(next_level)
	else:
		Scene.change("TitleScreen")
