extends Character
class_name Predator

export var menace := 300

var path : PredatorPath = null


func _ready() -> void:
	
	for child in get_children():
		if child is PredatorPath:
			path = child


func _process(delta: float) -> void:
	update()


func _draw() -> void:
	draw_circle(Vector2(), menace, Color("66FF0000"))
	pass
