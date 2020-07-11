extends KinematicBody2D
class_name Character

var speed := 0
var motion := Vector2()

onready var fsm = $FSM


func _ready() -> void:
	fsm.host = self


func move() -> void:
	move_and_slide(motion)


func change_state(state_name: String) -> void:
	print("%s: %s" % [name, state_name])
	fsm.change_state(state_name)
