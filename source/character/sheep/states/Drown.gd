extends State

func enter(host: Node) -> void:
	SFX.play_sfx("WaterSplash")
	host.anim.play("drown")
	yield(host.anim, "animation_finished")
	host.queue_free()

