extends Node

@onready var unit = $unit
@onready var combat_unit = $combat_unit;
@export var belonging_to:Node;

func combat_mode(in_combat:bool):
	match in_combat:
		true:
			combat_unit.enable();
			unit.disable();
		false:
			combat_unit.disable();
			unit.enable();

func new_owner(owner:Node):
	belonging_to = owner;
