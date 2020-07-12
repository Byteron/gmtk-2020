extends Control


onready var continue_button := $VBoxContainer/Continue


func _ready() -> void:

	if Global.current_level > 1:
		continue_button.show()
	else:
		continue_button.hide()


func _on_Play_pressed() -> void:
	Global.new_game()


func _on_Continue_pressed() -> void:
	Global.continue_game()


func _on_Quit_pressed() -> void:
	get_tree().quit()
