extends Control
class_name GameOver


func _on_Retry_pressed() -> void:
	Global.continue_game_current_level()


func _on_Menu_pressed() -> void:
	Scene.change("TitleScreen", true)
