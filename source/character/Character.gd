extends KinematicBody2D
class_name Character

export var orientation = Vector2(1, 0.75)

var speed := 0
var motion := Vector2()

onready var fsm := $FSM as FiniteStateMachine
onready var sprite := $Sprite as Sprite
onready var anim := $AnimationPlayer


func _ready() -> void:
	fsm.host = self


func _process(delta: float) -> void:

	if motion.x > 0:
		sprite.flip_h = false
	elif motion.x < 0:
		sprite.flip_h = true


func move() -> void:
	move_and_slide(motion)


func change_state(state_name: String) -> void:
	print("%s: %s" % [name, state_name])
	fsm.change_state(state_name)
