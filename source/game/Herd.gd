extends YSort
class_name Herd

export var radius := 300

var center := Vector2()

func _ready() -> void:
	
	for child in get_children():
		child.herd = self

func _process(delta: float) -> void:
	center = Vector2()
	
	for child in get_children():
		var sheep := child as Node2D
		
		center += sheep.global_position
	
	center = center / get_child_count()
	
	update()

func _draw() -> void:
	print("draw")
	draw_circle(center, 30, Color("AA00FF00"))
	draw_circle(center, radius, Color("5500FF00"))
