extends Node2D

var inhabitant:Node = null;

func get_inhabitant() -> Node2D:
	return inhabitant;

func set_inhabitant(newInhabitant:Node):
	inhabitant = newInhabitant;

func move_out():
	inhabitant = null;
