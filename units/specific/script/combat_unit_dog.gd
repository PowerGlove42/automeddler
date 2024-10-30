extends "res://units/generic/script/combat_unit.gd"

func attack(target:Node):
	print("i", self,"attack", target);


func _physics_process(delta: float) -> void:
	match current_state:
		states.MOVING:
			move(get_viewport().get_mouse_position());
			print("I am moving", self)
		states.ATTACKING:
			attack(attack_target);
		states.CONTROLLED:
			pass
		states.DISABLED:
			pass
