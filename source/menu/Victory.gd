extends Control
class_name Victory


func _on_NextLevel_pressed() -> void:
	Global.continue_game_next_level()


func _on_Replay_pressed() -> void:
	Global.continue_game_current_level()
	

func _on_Menu_pressed() -> void:
	Scene.change("TitleScreen", true)
