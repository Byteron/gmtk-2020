extends Control


onready var continue_button := $VBoxContainer/Continue

onready var buttons := $VBoxContainer.get_children()

onready var pointer := $Pointer
onready var tween := $Tween


func _ready() -> void:
	for button in buttons:
		button.connect("mouse_entered", self, "_tween_pointer", [ button ])
		button.connect("mouse_exited", pointer, "hide")

	if Global.current_level > 1:
		continue_button.show()
	else:
		continue_button.hide()


func _tween_pointer(control: Control) -> void:
	pointer.rect_global_position.x = control.rect_global_position.x - 15
	pointer.rect_global_position.y = control.rect_global_position.y
	pointer.rect_size.y = 0
	
	pointer.show()
	
	tween.interpolate_property(pointer, "rect_size:y", 0, control.rect_size.y, 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()

func _on_Play_pressed() -> void:
	Global.current_level = 1
	Global.save_game()
	Scene.change("Level1", true)


func _on_Continue_pressed() -> void:
	var level = "Level%d" % Global.current_level
	Scene.change(level, true)


func _on_Quit_pressed() -> void:
	get_tree().quit()
