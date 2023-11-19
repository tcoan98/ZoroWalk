extends Node

class_name State

@export var can_move : bool = true

var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass
	
func on_enter():
	pass
	
func on_exit():
	pass
