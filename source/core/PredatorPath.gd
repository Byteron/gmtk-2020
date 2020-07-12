tool
extends Path2D
class_name PredatorPath


var path := []


func _process(delta: float) -> void:
	update()


func _ready() -> void:
	for point in curve.get_baked_points():
		path.append(point + global_position)


func _get_configuration_warning() -> String:
	var warning := ""

	if not get_parent().is_in_group("Predator"):
		warning += "Only works if the parent is a Predator"

	return warning
