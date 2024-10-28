extends Node2D
enum level {
	ONE,
	TWO,
	THREE
}
@onready var drag = $drag;
@onready var stars = $star;
@onready var sprite = $Sprite2D;
@onready var info_panel = $info_panel;
var current_level = level.ONE

func _ready() -> void:
	drag.current_state = drag.states.HELD;

func goodbye():
	drag.call_deferred("clean")
	get_parent().call_deferred("queue_free");

func level_up():
	match current_level:
		level.ONE:
			sprite.apply_scale(Vector2(1.2, 1.2));
			current_level = level.TWO;
			stars.frame = level.TWO;
		level.TWO:
			sprite.apply_scale(Vector2(1.5, 1.5));
			current_level = level.THREE;
			stars.frame = level.THREE;
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
