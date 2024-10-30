extends Node

@onready var unit = $unit
@onready var combat_unit = $combat_unit;

func _on_check_button_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			combat_unit.enable();
			unit.disable();
		false:
			combat_unit.disable();
			unit.enable();

func combat_mode(in_combat:bool):
	match in_combat:
		true:
			combat_unit.enable();
			unit.disable();
		false:
			combat_unit.disable();
			unit.enable();
