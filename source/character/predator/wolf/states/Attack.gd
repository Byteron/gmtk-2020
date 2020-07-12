extends State

export var speed := 800

var target : Node2D = null 

onready var attack_timer := $AttackTimer


func enter(host: Node) -> void:
	var predator := host as Predator
	
	target = predator.get_random_sheep_in_range()
	
	if not target:
		predator.change_state("Patrol")
		return
	
	predator.anim.play("walk")
	SFX.play_sfx("WolfAttack")
	attack_timer.start()


func update(host: Node, delta: float) -> void:
	var predator := host as Predator
	
	if attack_timer.is_stopped():
		if not predator.is_sheep_in_range() or not target:
			predator.change_state("Patrol")
			return
	
	
	if predator.global_position.distance_to(target.global_position) < 100:
		target.kill()
		predator.change_state("Eat")
		return
	
	var direction = predator.global_position.direction_to(target.global_position)
	
	predator.motion = direction * speed
	predator.move()


func exit(host: Node) -> void:
	var predator := host as Wolf
	target = null

