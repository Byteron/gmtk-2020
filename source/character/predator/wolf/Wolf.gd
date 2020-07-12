extends Predator
class_name Wolf


onready var coll := $CollisionShape2D as CollisionShape2D


func step() -> void:
	SFX.play_sfx("AnimalFootstep")


func _ready() -> void:
	change_state("Patrol")
