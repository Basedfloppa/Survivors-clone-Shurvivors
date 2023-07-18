extends CharacterBody2D


const spd = 100

func _process(delta):
	
	movement()

func movement():
	var x_str = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_str = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_str,y_str)
	velocity = mov.normalized() * spd
	move_and_slide() 

