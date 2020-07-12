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


func is_sheep_in_range() -> bool:
	var sheeps = get_tree().get_nodes_in_group("Sheep")
	
	for sheep in sheeps:
		if sheep.global_position.distance_to(global_position) < menace:
			return true
	
	return false


func get_random_sheep_in_range() -> Node2D:
	var sheeps = get_tree().get_nodes_in_group("Sheep")
	var sheeps_in_range := []
	
	if not sheeps:
		return null
	
	for sheep in sheeps:
		if sheep.global_position.distance_to(global_position) < menace:
			sheeps_in_range.append(sheep)
	
	sheeps_in_range.shuffle()
	return sheeps_in_range.pop_front()


func _draw() -> void:
	draw_circle(Vector2(), menace, Color("66FF0000"))
	pass
