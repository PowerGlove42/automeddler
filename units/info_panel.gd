extends Node2D
var wizard = "res://units/traits/wizard.tscn";
var warrior = "res://units/traits/warrior.tscn";
@onready var hp = $hp;
@onready var attack = $attack;
@onready var hflow = $HFlowContainer;
@onready var text = $text;


func _ready() -> void:
	update(3,4,"this unit does nothing",[wizard, warrior]);

func update(hp:int, attack:int, text:String, classes:Array):
	self.hp.text = str(hp);
	self.attack.text = str(attack);
	self.text.text = text;
	for i in hflow.get_children():
		i.call_deferred("queue free");
	for i in classes:
		var instance = load(i);
		instance = instance.instantiate();
		hflow.add_child(instance);
