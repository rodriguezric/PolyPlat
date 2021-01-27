extends KinematicBody2D

export (int) var gravity = 500
export (int) var speed = 150
export (int) var jump_force = -175
export (float) var friction = 0.5

var fall_speed: int
var motion: Vector2

func _ready():
    fall_speed = abs(jump_force)


# Namespaced inputs specific to PolyPlat framework
func apply_inputs():
	if Input.is_action_pressed("polyplat.left"):
		motion.x = -speed
		
	if Input.is_action_pressed("polyplat.right"):
		motion.x = speed
		
	if Input.is_action_just_pressed("polyplat.jump"):
		if is_on_floor():
			motion.y = jump_force


func apply_friction():
    motion.x = lerp(motion.x, 0, friction)


func apply_gravity(delta):
	motion.y += gravity * delta
	
	if motion.y > 0:
		motion.y = min(motion.y, abs(jump_force))
	

func _physics_process(delta):
	apply_inputs()
	apply_friction()
	apply_gravity(delta)
    move_and_slide(motion, Vector2.UP)
