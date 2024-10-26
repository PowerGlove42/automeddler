extends Node2D

enum states{
	FLOATING,
	RESTING,
	HELD,
}

var home: Node2D = null;
var current_state;
var moused_over: bool = false;

@onready var marker = $Marker2D;
@onready var area2d = $Area2D;

func _ready() -> void:
	current_state = states.RESTING;

func _physics_process(delta: float) -> void:
	if (current_state == states.FLOATING):
		if home:
			move_towards(home.global_position)
			if global_position == home.global_position:
				current_state = states.RESTING;
	elif (current_state == states.RESTING):
		pass
	elif (current_state == states.HELD):
		follow_mouse();
	else:
		push_error("state not set");

func move_towards(location: Vector2) -> void:
	global_position = lerp(global_position, location, 0.5);

func follow_mouse() -> void:
	global_position = get_viewport().get_mouse_position();

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("ui_left_mouse") and current_state == states.RESTING:
		if home:
			home.move_out();
		current_state = states.HELD;
	elif event.is_action_released("ui_left_mouse") and current_state == states.HELD:
		set_new_home();
	elif event.is_action_pressed("ui_left_mouse") and current_state == states.FLOATING:
		current_state = states.HELD;

func _on_area_2d_mouse_entered() -> void:
	moused_over = true;

func _on_area_2d_mouse_exited() -> void:
	moused_over = false;


	

func set_new_home():
	var target = find_next_home();
	var partner = null;
	if target:
		partner = target.get_inhabitant();
	if partner:
		partner.rehome(home);
	rehome(target);

func find_next_home() -> Node:
	var target:Node2D = home;
	var distance = 9999999999;
	for i in area2d.get_overlapping_areas():
		if (i.global_position - global_position).length() < distance:
			target = i.get_parent();
	return target

func rehome(target: Node2D) -> void:
	home = target;
	current_state = states.FLOATING;
	if home:
		home.set_inhabitant(self);
