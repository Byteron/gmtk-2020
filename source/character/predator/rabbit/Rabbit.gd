extends Predator
class_name Rabbit


func step() -> void:
	SFX.play_sfx("AnimalFootstep")


func _ready() -> void:
	change_state("Patrol")
