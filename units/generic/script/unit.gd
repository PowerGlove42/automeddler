extends Node2D
enum level {
	ONE,
	TWO,
	THREE
}

@export var combat_unit:Node;
@export var belonging_to:Node = self;

func combat_mode(in_combat:bool):
	match in_combat:
		true:
			combat_unit.enable();
			drag.disable();
			
		false:
			combat_unit.disable();
			drag.enable();
func new_owner(owner:Node):
	belonging_to = owner;

@export var drag:Node;
@onready var stars = $star;
@export var sprite:Node;
@export var info_panel:Node
#stats to update
var current_level = level.ONE
#@export var attack:int = 0;
@export var attack:Array [int] = [10, 11, 12];
@export var hp:Array [int] = [50, 60, 120];
@export var text:Array[String] = ["no description, but level 1", "no discription but level 2", "no description, but level 3"];
@export var traits:Array[PackedScene];

func enable():
	set_process_internal(true);
	set_physics_process_internal(true);
	drag.enable();


func disable():
	set_process_internal(false);
	set_physics_process_internal(false);
	drag.disable();


func _ready() -> void:
	drag.current_state = drag.states.HELD;
	update_info();

func update_info():
	info_panel.update(hp[current_level], attack[current_level], current_level+1, text[current_level], traits);

func goodbye():
	drag.call_deferred("clean")
	call_deferred("queue_free");

func level_up():
	match current_level:
		level.ONE:
			sprite.apply_scale(Vector2(1.2, 1.2));
			current_level = level.TWO;
			stars.frame = level.TWO;
			update_info();
		level.TWO:
			sprite.apply_scale(Vector2(1.5, 1.5));
			current_level = level.THREE;
			stars.frame = level.THREE;
			update_info();
		level.THREE:
			pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("ui_right_mouse"):
		info_panel.visible = true;
		info_panel.global_position = Vector2(450,200)
	if event.is_action_released("ui_right_mouse"):
		info_panel.visible = false;


func _on_area_2d_mouse_exited() -> void:
	info_panel.visible = false;
