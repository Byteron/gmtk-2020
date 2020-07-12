extends State

func enter(host: Node) -> void:
	SFX.play_sfx("SheepDie")
	host.anim.play("die")
	yield(host.anim, "animation_finished")
	host.queue_free()

