extends Control


onready var continue_button := $CenterContainer/VBoxContainer/Continue


func _ready() -> void:
	if Global.current_level > 1:
		continue_button.show()
	else:
		continue_button.hide()


func _on_Play_pressed() -> void:
	Global.current_level = 1
	Global.save_game()
	Scene.change("Level1")


func _on_Continue_pressed() -> void:
	var level = "Level%d" % Global.current_level
	Scene.change(level)


func _on_Quit_pressed() -> void:
	get_tree().quit()

