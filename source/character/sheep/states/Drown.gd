extends State

func enter(host: Node) -> void:
	host.anim.play("drown")
	yield(host.anim, "animation_finished")
	host.queue_free()

