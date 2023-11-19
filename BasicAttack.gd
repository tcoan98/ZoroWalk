extends State

@export var return_state : State
@export var return_animation_node : String = "Move"
@export var basic_attack_name : String = "Basic Attack"

func state_input(event : InputEvent):
	pass

func _on_animation_tree_animation_finished(anim_name):
	print("Entering _on_animation_tree_animation_finished with animation name "+anim_name)
	if(anim_name == basic_attack_name):
		print("Entering anim_name==basic_attack_name with anim_name "+anim_name+" and basic_att_name "+basic_attack_name)
		next_state = return_state
		print("assigning next state to "+return_state.name)
		playback.travel(return_animation_node)
		print("calling playback travel on return_animation_node "+return_animation_node)
#See tutorial for combo attacks
#Add Timer child to attack state
#Set to ~half time of attack animation
#Set to One Shot
