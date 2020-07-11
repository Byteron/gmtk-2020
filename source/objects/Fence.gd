extends StaticBody2D

export(Array, Texture) var variations := []

onready var sprite = $Sprite

func _ready() -> void:
	if not variations:
		return
	
	sprite.texture = variations[randi() % variations.size()]
