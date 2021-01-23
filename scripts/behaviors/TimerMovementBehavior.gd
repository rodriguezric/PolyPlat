extends Node2D

# Attach a Timer node to the kinematic body and use the timeout
# signal to trigger the actions. Manage the frequency of the
# actions with the timeout interval. Actions are stored in 
# an array, current actions supported are 'wait', 'up', 'down'
# and 'left'. 

# I like to use this behavior to create moving platforms with 
# KinematicBody2Ds and to create simple enemy behaviors on
# Area2Ds. 


export var speed : int = 20
export(Array, String) var actions = ['wait', 'up', 'wait', 'down']
var current_action : int = 0
var motion : Vector2


func _ready():
	process_action()


func next_action():
	current_action = (current_action + 1) % len(actions)


func process_action():
	match actions[current_action]:
		'wait': 
			motion.x = 0
			motion.y = 0
		'up':
			motion.x = 0
			motion.y = -speed
		'down':
			motion.x = 0
			motion.y = speed
		'left':
			motion.x = -speed
			motion.y = 0
		'right':
			motion.x = speed
			motion.y = 0


func _physics_process(delta):
	move_local_x(delta * motion.x)
	move_local_y(delta * motion.y)


func _on_Timer_timeout():
	next_action()
	process_action()

