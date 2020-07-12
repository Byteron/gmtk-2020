extends Predator
class_name Wolf


func step() -> void:
	SFX.play_sfx("AnimalFootstep")


func _ready() -> void:
	if path:
		change_state("Patrol")
