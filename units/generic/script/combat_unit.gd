extends CharacterBody2D

enum states {
	MOVING,
	ATTACKING,
	CONTROLLED,
	DISABLED
}
var current_state:states = states.DISABLED;
var item:Node;
var hp:int = 50;
var current_hp:int = 50;
var damage:int = 5;
var move_target:Vector2;
var attack_target:Node;
var move_speed:float = 1;
var enemy_player:Node = null;
var enemy_units:Array [Node];
@export var anchor:Node = self;

func find_enemy_units() -> Array [Node]:
	enemy_player = anchor.belonging_to.current_enemy;
	if enemy_player:
		return enemy_player.get_combat_units();
	else:
		push_error("no enemy")
		return [null];

func get_anchor() -> Node:
	return self.anchor;

func set_enemy_player(player:Node):
	enemy_player = player;

func enable():
	move_target = anchor.global_position;
	enemy_units = find_enemy_units();
	current_state = states.MOVING;
	set_physics_process_internal(true);

func disable():
	current_state = states.DISABLED;
	set_physics_process_internal(false);

func move(target:Vector2):
	if anchor.global_position != target:
		anchor.global_position += -(anchor.global_position - target).normalized() * move_speed;


func take_damage(damage:int):
	current_hp -= damage;
	if hp <= 0:
		die();


func die():
	print(self, "died");
