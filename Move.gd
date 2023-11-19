extends State

class_name Move
# Called when the node enters the scene tree for the first time.

@export var jump_velocity : float = -150
@export var air_state : State
@export var attack_state : State
@export var attack_node : String = "Basic Attack"

func state_input(event : InputEvent):
	if event.is_action_pressed("jump"):
		jump()
	if event.is_action_pressed("attack"):
		print("attack action pressed, calling attack()")
		attack()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state

func attack():
	print("entered attack.")
	next_state = attack_state
	print("assigned next_state to "+attack_state.name)
	playback.travel(attack_node)
	print("calling travel to "+ attack_node)
