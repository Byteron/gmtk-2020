extends State

export var speed := 800

var target : Node2D = null 


func enter(host: Node) -> void:
	var wolf := host as Wolf
	call_deferred("disable", wolf)
	wolf.coll.disabled = true
	wolf.anim.play("bite")
	SFX.play_sfx("WolfAttack")
	yield(wolf.anim, "animation_finished")
	wolf.anim.play("idle")
	SFX.play_sfx("WolfEat")
	yield(get_tree().create_timer(8.0), "timeout")
	call_deferred("enable", wolf)
	wolf.change_state("Patrol")


func enable(wolf: Wolf) -> void:
	wolf.coll.disabled = false


func disable(wolf: Wolf) -> void:
	wolf.coll.disabled = true


func exit(host: Node) -> void:
	var wolf := host as Wolf
	target = null

