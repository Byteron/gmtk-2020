extends State

export var speed := 800

var target : Node2D = null 


func enter(host: Node) -> void:
	var predator := host as Predator
	predator.anim.play("bite")
	SFX.play_sfx("WolfAttack")
	yield(predator.anim, "animation_finished")
	predator.anim.play("idle")
	SFX.play_sfx("WolfEat")
	yield(get_tree().create_timer(8.0), "timeout")
	predator.change_state("Patrol")



func exit(host: Node) -> void:
	var predator := host as Wolf
	target = null

