extends Predator
class_name Shepherd


func _ready() -> void:
	change_state("Idle")


func step() -> void:
	SFX.play_sfx("ShepherdFootstep")


func get_input_direction() -> Vector2:

	var up = Input.is_action_pressed("walk_up")
	var down = Input.is_action_pressed("walk_down")
	var left = Input.is_action_pressed("walk_left")
	var right = Input.is_action_pressed("walk_right")

	return Vector2(int(right) - int(left), int(down) - int(up))
