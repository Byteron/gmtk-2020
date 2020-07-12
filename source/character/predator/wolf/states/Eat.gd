extends State

export var speed := 800

var target : Node2D = null 


func enter(host: Node) -> void:
	var wolf := host as Wolf
	wolf.coll.disabled = true
	wolf.anim.play("bite")
	SFX.play_sfx("WolfAttack")
	yield(wolf.anim, "animation_finished")
	wolf.anim.play("idle")
	SFX.play_sfx("WolfEat")
	yield(get_tree().create_timer(8.0), "timeout")
	wolf.change_state("Patrol")



func exit(host: Node) -> void:
	var wolf := host as Wolf
	target = null

