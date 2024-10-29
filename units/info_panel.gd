extends Node2D
@onready var hp = $hp;
@onready var attack = $attack;
@onready var wizard = $HFlowContainer/wizard;
@onready var warrior = $HFlowContainer/warrior;
@onready var ranged = $HFlowContainer/ranged;
@onready var melee = $HFlowContainer/melee;

func update(hp:int, attack:int, classes:Array):
	self.hp.text = hp;
	self.attack.text = attack;
	match classes:
		"wizard":
			self.wizard.visible = true;
		"warrior":
			self.warrior.visile = true;
		"ranged":
			self.ranged.visible = true;
		"melee":
			self.melee.visible = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
