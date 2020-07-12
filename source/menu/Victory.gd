extends Control
class_name Victory


onready var ratings := $Rating


func _ready() -> void:
	Global.increase_level()
	ratings.rate(Global.sheeps, Global.max_sheeps)


func _on_NextLevel_pressed() -> void:
	Global.continue_game()


func _on_Replay_pressed() -> void:
	Global.decrease_level()
	Global.continue_game()
	

func _on_Menu_pressed() -> void:
	Scene.change("TitleScreen", true)
