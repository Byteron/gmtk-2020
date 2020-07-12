extends Character
class_name Sheep

onready var safe_zone := $SafeZone

onready var sweat_particles := $SweatParticles
onready var blood_particles := $BloodParticles

onready var coll := $CollisionShape2D as CollisionShape2D

var herd : Herd = null


var is_dead := false


func _ready() -> void:
	change_state("Idle")


func step() -> void:
	SFX.play_sfx("AnimalFootstep")


func sweat() -> void:
	sweat_particles.emitting = true


func bleed() -> void:
	blood_particles.emitting = true


func drown() -> void:
	is_dead = true
	coll.disabled = true
	change_state("Drown")


func kill() -> void:
	is_dead = true
	coll.disabled = true
	change_state("Die")


func get_herd_center() -> Vector2:
	if not herd:
		return global_position
	return herd.center


func get_herd_direction() -> Vector2:
	if not herd:
		return Vector2()
		
	return global_position.direction_to(herd.center)


func get_obstacles() -> Array:
	var obstacles := []
	var bodies = safe_zone.get_overlapping_bodies()
	
	for body in bodies:
		if body and body != self and body.is_in_group("Obstacle"):
			obstacles.append(body)
	
	return obstacles


func is_predator_nearby() -> bool:
	var predators = get_tree().get_nodes_in_group("Predator")
	
	for node in predators:
		var predator := node as Node2D
		
		if not predator:
			continue
		
		if global_position.distance_to(predator.global_position) < predator.menace:
			return true
	
	return false


func is_obstacle_nearby() -> bool:
	return get_obstacles().size() > 0


func is_in_herd() -> bool:
	return global_position.distance_to(get_herd_center()) < herd.radius
