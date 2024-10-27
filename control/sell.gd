extends Node2D

var inhabitant:Node = null;
var empty:bool = true;
@onready var sprite = $Sprite2D;

func get_inhabitant() -> Node2D:
	return inhabitant;

func set_inhabitant(newInhabitant:Node):
	inhabitant = newInhabitant;
	empty = false;
	newInhabitant.get_parent().goodbye();
	move_out(); 

func move_out():
	inhabitant = null;
	empty = true


func _on_mouse_detector_mouse_entered() -> void:
	sprite.frame = 1;

func _on_mouse_detector_mouse_exited() -> void:
	sprite.frame = 0;
