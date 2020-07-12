extends Node2D
class_name Level

const LEVEL := "Level%d"

export var level_number := 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		Scene.change("Victory", true)


func _ready() -> void:
	var sheeps = get_tree().get_nodes_in_group("Sheep")
	Global.max_sheeps = sheeps.size()


func victory() -> void:
	var sheeps = get_tree().get_nodes_in_group("Sheep")
	Global.sheeps = sheeps.size()
	Scene.change("Victory", true)


func game_over() -> void:
	Scene.change("GameOver", true)


func _on_WinConditionCheckTimer_timeout() -> void:
	var safe_sheeps := 0
	
	for place in get_tree().get_nodes_in_group("SafePlace"):
		safe_sheeps += place.get_sheeps().size()
	
	var sheeps = get_tree().get_nodes_in_group("Sheep")
	
	if sheeps.size() == 0:
		game_over()
	
	elif safe_sheeps == sheeps.size():
		victory()
