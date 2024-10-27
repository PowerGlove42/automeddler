extends Node2D

@onready var drag = $drag;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drag.current_state = drag.states.HELD;
