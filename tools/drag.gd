extends Node2D

enum states{
	FLOATING,
	RESTING,
	HELD,
}

var home: Node2D = null;
var current_state = states.RESTING;
var moused_over: bool = false;
var parent;

@onready var marker = $Marker2D;
@onready var area2d = $Area2D;
@onready var shape = $Area2D/CollisionShape2D;

func _ready() -> void:
	if home != null:
		home.move_out();
	parent = get_parent();
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		current_state = states.HELD;


func _physics_process(delta: float) -> void:
	if (current_state == states.FLOATING):
		if home:
			move_towards(home.global_position)
			if global_position == home.global_position:
				current_state = states.RESTING;
		else:
			push_warning("home is not set!");
	elif (current_state == states.RESTING):
		pass
	elif (current_state == states.HELD):
		follow_mouse();
		if Input.is_action_just_released("ui_left_mouse"):
			set_new_home();
	else:
		push_error("state not set");

func move_towards(location: Vector2) -> void:
	parent.global_position = lerp(global_position, location, 0.5);

func follow_mouse() -> void:
	parent.global_position = get_viewport().get_mouse_position();

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("ui_left_mouse") and current_state == states.RESTING:
		if home:
			home.move_out();
		else:
			push_warning("home is not set!");
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
	else:
		push_warning("target not found");
	if partner != null:
		partner.rehome(home);
	rehome(target);

func find_next_home() -> Node:
	var target:Node2D = home;
	var distance = 9999999999;
	var areas = area2d.get_overlapping_areas();
	if target == null:
		for i in get_tree().get_nodes_in_group("drop"):
			if i.empty:
				if (i.global_position - global_position).length() < distance:
					distance = (i.global_position - global_position).length();
					target = i;
		return target
	if areas.size() > 0:
		for i in area2d.get_overlapping_areas():
			if (i.global_position - global_position).length() < distance:
				distance = (i.global_position - global_position).length();
				target = i.get_parent();
	return target;


func rehome(target: Node2D) -> void:
	home = target;
	current_state = states.FLOATING;
	if home:
		home.set_inhabitant(self);
	else:
		push_warning("home is not set!");

func clean():
	if home != null:
		home.move_out()
