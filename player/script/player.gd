extends Node2D

@export var player_name:String = "gruber";
@export var player_hp:int = 100;
@export var current_enemy:Node;
@export var combat_units:Array [Node];
var units:Array [Node];

func get_combat_units() -> Array[Node]:
	return combat_units;
