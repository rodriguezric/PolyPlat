extends KinematicBody2D


export (int) var gravity = 500
export (int) var speed = 150
export (int) var jump_force = -175
export (float) var friction = 0.5
var motion : Vector2

func apply_inputs():
	if Input.is_action_pressed("left"):
		motion.x = -speed
		
	if Input.is_action_pressed("right"):
		motion.x = speed
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			motion.y = jump_force


func apply_friction():
	if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = lerp(motion.x, 0, friction)


func apply_gravity(delta):
	motion.y += gravity * delta
	
	if motion.y > 0:
		motion.y = min(motion.y, abs(jump_force) * 1.5)
	
	if is_on_floor():
		motion.y = min(motion.y, 5)

func _physics_process(delta):
	apply_inputs()
	apply_friction()
	apply_gravity(delta)
	motion.y = move_and_slide(motion, Vector2.UP).y
