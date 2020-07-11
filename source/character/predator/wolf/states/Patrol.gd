extends State

export var speed := 300


var path := []
var target := Vector2(0, 0)

func enter(host: Node) -> void:
	var wolf := host as Wolf


func update(host: Node, delta: float) -> void:
	var wolf := host as Wolf
	
	if not path:
		path = wolf.path.path.duplicate()
	
	if not target or wolf.global_position.distance_to(target) < 5:
		target = path.pop_front()
		print("Target: ", target, " Position: ", wolf.global_position)

	var direction = wolf.global_position.direction_to(target)
	
	wolf.motion = direction * speed
	wolf.move()


func exit(host: Node) -> void:
	var wolf := host as Wolf

