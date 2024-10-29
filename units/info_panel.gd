extends Node2D
var wizard = "res://units/traits/wizard.tscn";
var warrior = "res://units/traits/warrior.tscn";
@onready var hp = $hp;
@onready var attack = $attack;
@onready var hflow = $HFlowContainer;
@onready var text = $text;
@onready var level = $level;

func update(hp:int, attack:int,level:int, text:String, classes:Array[PackedScene]):
	for i in hflow.get_children():
		i.queue_free();
	for i in classes:
		var instance = i.instantiate();
		hflow.add_child(instance);
	self.hp.text = str(hp);
	self.attack.text = str(attack);
	self.level.text = str(level);
	self.text.text = text;
