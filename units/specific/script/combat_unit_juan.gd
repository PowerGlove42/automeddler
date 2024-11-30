extends "res://units/generic/script/combat_unit.gd"

enum attack_states{
	DASHING,
	A_ATTACKING
	}
var current_attack_state = states.A_ATTACKING;

func attack(target:Node):
	#TODO: replace with state machine
	match current_attack_state:
		attack_states.DASHING:
			pass;
		#TODO: code for Dash
		attack_states.A_ATTACKING:
			pass;
		#TODO: code for auto attacking

	var dash_min_range = 70
	var target_direction = (anchor.global_position - target.global_position).normalized();
	var target_vector = anchor.global_position - target.global_position;
	if target_vector.length() > 20:
		anchor.global_position -= target_direction * 10; 
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
