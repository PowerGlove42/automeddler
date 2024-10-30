extends Node2D

var inhabitant:Node = null;
var empty:bool = true;

func get_inhabitant() -> Node2D:
	return inhabitant;

func set_inhabitant(newInhabitant:Node):
	inhabitant = newInhabitant;
	empty = false;

func move_out():
	inhabitant = null;
	empty = true
