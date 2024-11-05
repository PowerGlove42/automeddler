extends "res://units/generic/script/combat_unit.gd"

func attack(target:Node):
	pass

func _physics_process(delta: float) -> void:
	match current_state:
		states.MOVING:
			if not attack_target:
				attack_target = find_attack_target();
				move_target = attack_target.global_position;
			move(move_target);
			print("I am moving", move_target)
			if (anchor.global_position - move_target).length() < 30:
				current_state = states.ATTACKING;
		states.ATTACKING:
			attack(attack_target);
		states.CONTROLLED:
			pass
		states.DISABLED:
			pass

func find_attack_target() -> Node:
	var distance = 99999999999999;
	var ret:Node
	if enemy_units.size() > 0:
		for i in enemy_units:
			if (anchor.global_position - i.global_position).length() < distance:
				distance = (anchor.global_position - i.global_position).length();
				ret = i;
	else:
		ret = null;
	return ret;
