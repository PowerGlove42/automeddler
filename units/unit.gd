extends Node2D
enum level {
	ONE,
	TWO,
	THREE
}
@onready var drag = $drag;
@onready var stars = $star;
@onready var sprite = $Sprite2D;
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
