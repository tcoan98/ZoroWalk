extends Node

class_name CharacterStateMachine

@export var current_state : State
@export var character : CharacterBody2D
@export var animation_tree: AnimationTree

var states : Array[State]
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
			
			child.character = character
			child.playback = animation_tree["parameters/playback"]
		else:
			push_warning("Child " + child.name + " is not a state for CharacterStateMachine")

func _physics_process(delta):
	if current_state.next_state != null:
		print("Switching states from " + current_state.name + " to " + current_state.next_state.name)
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)

func check_if_can_move():
	return current_state.can_move

func switch_states(new_state: State):
	if current_state != null:
		print("current state is not null")
		current_state.on_exit()
		print("calling on_exit() for current state")
		current_state.next_state = null
		print("assigning current_state.next_state to null for "+current_state.name)
	current_state = new_state
	print("current_state assigned to "+current_state.name)
	
	current_state.on_enter()
	print("called current_state.on_enter()")

func _input(event : InputEvent):
	current_state.state_input(event)
	print("called current_state.state_input for event ")
