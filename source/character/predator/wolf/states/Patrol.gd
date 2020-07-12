extends State

export var speed := 300


var path := []
var target := Vector2(0, 0)

func enter(host: Node) -> void:
	var predator := host as Predator
	
	if predator.path:
		predator.anim.play("walk")


func update(host: Node, delta: float) -> void:
	var predator := host as Predator
	
	if predator.is_sheep_in_range():
		predator.change_state("Attack")
		return
	
	if predator.path:
		if not path:
			path = predator.path.path.duplicate()
		
		if not target or predator.global_position.distance_to(target) < 5:
			target = path.pop_front()
			print("Target: ", target, " Position: ", predator.global_position)
	
		var direction = predator.global_position.direction_to(target)
		
		predator.motion = direction * speed
		predator.move()


func exit(host: Node) -> void:
	var predator := host as Wolf

