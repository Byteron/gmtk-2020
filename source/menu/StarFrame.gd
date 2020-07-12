extends TextureRect
class_name StarFrame

onready var star := $Star
onready var tween := $Tween


func _ready() -> void:
	star.rect_scale = Vector2(0, 0)


func animate() -> void:
	tween.interpolate_property(star, "rect_scale", Vector2(), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()
