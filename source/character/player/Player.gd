extends Character
class_name Player


func _ready() -> void:
	change_state("Idle")


func get_input_direction() -> Vector2:

	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	return Vector2(int(right) - int(left), int(down) - int(up))
