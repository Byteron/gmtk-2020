extends Control
class_name Rating

onready var star_frames = get_children()


func rate(sheeps: int, max_sheeps: int) -> void:
	print("Rate: %d / %d" % [sheeps, max_sheeps])
	
	if max_sheeps == 0:
		return
	
	var stars := 0
	
	if sheeps == max_sheeps:
		stars = 3
	elif sheeps >= max_sheeps / 2:
		stars = 2
	else:
		stars = 1
	
	animate(stars)


func animate(stars: int):
	yield(get_tree().create_timer(0.3), "timeout")
	
	for i in stars:
		
		star_frames[i].animate()
		yield(get_tree().create_timer(0.3), "timeout")
