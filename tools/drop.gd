extends Node2D

enum states{
	FLOATING,
	RESTING,
	HELD,
}

var current_state;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_state = states.FLOATING;

func _physics_process(delta: float) -> void:
	if (current_state == states.FLOATING):
		pass
	elif (current_state == states.RESTING):
		pass
	elif (current_state == states.HELD):
		pass
	else:
		push_error("state not set");





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
