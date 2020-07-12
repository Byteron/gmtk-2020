extends Predator
class_name Wolf


func step() -> void:
	SFX.play_sfx("AnimalFootstep")


func _ready() -> void:
	change_state("Patrol")
