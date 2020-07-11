extends Character
class_name Predator

export var menace := 300

func _process(delta: float) -> void:
	update()

func _draw() -> void:
	draw_circle(Vector2(), menace, Color("66FF0000"))
	pass
