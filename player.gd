extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var is_attacking = false
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine = $CharacterStateMachine
var in_area = true
var facing_right = true
var last_position = position
var moving_offscreen = false

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	var blend_space
	var att_blend_space
	# Get the input direction and handle the movement/deceleration..
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction.x == 0 && input_direction.y == 0:
		move_toward(velocity.x,0,SPEED)
		move_toward(velocity.y,0,SPEED)
		if (facing_right):
			blend_space = .1
		else:
			blend_space = -.1
	else:
		if(input_direction.x > 0):
			facing_right = true
			blend_space = 1
		else:
			facing_right = false
			blend_space = -1
	if facing_right: att_blend_space = 1
	else: att_blend_space = -1 
	animation_tree.set("parameters/Move/blend_position",blend_space)
	animation_tree.set("parameters/Basic Attack/blend_position",att_blend_space)

	if  state_machine.check_if_can_move():
		velocity = Vector2(input_direction.x*SPEED,input_direction.y*SPEED*.25)
	else:
		print("can_move is false.")
	
	move_and_slide()

