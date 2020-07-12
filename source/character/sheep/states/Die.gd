extends State

func enter(host: Node) -> void:
	host.anim.play("die")
	yield(host.anim, "animation_finished")
	host.queue_free()

