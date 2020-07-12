extends YSort
class_name Herd

export var radius := 300
export var max_radius := 600

var center := Vector2()

func _ready() -> void:
	
	for child in get_children():
		child.herd = self


func _process(delta: float) -> void:
	var last_center = center
	
	center = Vector2()
	
	var dead := 0
	
	for child in get_children():
		var sheep := child as Node2D
		
		if sheep.is_dead or sheep.global_position.distance_to(last_center) > max_radius:
			dead += 1
			continue
		
		center += sheep.global_position
	
	center = center / (get_child_count() - dead)
	
	update()


func _draw() -> void:
	# draw_circle(center, 30, Color("AA00FF00"))
	# draw_circle(center, radius, Color("5500FF00"))
	# draw_circle(center, max_radius, Color("5500FF00"))
	pass
