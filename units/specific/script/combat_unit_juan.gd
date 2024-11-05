extends "res://units/generic/script/combat_unit.gd"

func attack(target:Node):
	if (anchor.global_position - target.global_position).length() > 50:
		anchor.global_position += ((target.global_position - anchor.global_position).normalized() * 20) + (target.global_position - anchor.global_position);
	print("i", self,"attack", target);



func _physics_process(delta: float) -> void:
	match current_state:
		states.MOVING:
			if not attack_target:
				attack_target = find_attack_target();
				move_target = attack_target.global_position;
			move(move_target);
			print("I am moving", move_target)
			if (anchor.global_position - move_target).length() < 300:
				current_state = states.ATTACKING;
		states.ATTACKING:
			attack(attack_target);
		states.CONTROLLED:
			pass
		states.DISABLED:
			pass

func find_attack_target() -> Node:
	var minhp = 99999999999999;
	var ret:Node
	if enemy_units.size() > 0:
		for i in enemy_units:
			if i.combat_unit.current_hp < minhp:
				ret = i;
	else:
		ret = null;
	return ret;
