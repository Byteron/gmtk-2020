tool
extends Sprite

export(int, 0, 3) var variation := 1 setget _set_variation


var decals := [
	preload("res://graphics/images/decal_1.png"),
	preload("res://graphics/images/decal_2.png"),
	preload("res://graphics/images/decal_3.png"),
	preload("res://graphics/images/decal_4.png"),
]


func _set_variation(_variation: int) -> void:
	variation = _variation
	texture = decals[variation]
