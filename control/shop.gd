extends Control

@export var anchor:Node;
#var units = [];
const juan = "res://control/spawner_juan.tscn"
const dog = "res://control/spawner_dog.tscn"
const based = "res://control/spawner_based.tscn"
const lancerlot = "res://control/spawner_lancerlot.tscn"
@onready var hbox = $HBoxContainer;

func _ready() -> void:
	if not anchor:
		anchor = get_parent();
	for i in range(0, 5, 1):
		var rand = randi_range(0, 3);
		var offer;
		var offer_button
		match rand:
			0:
				offer = load(juan);  
			1:
				offer = load(dog);
			2:
				offer = load(based); 
			3:
				offer = load(lancerlot);
		offer_button = offer.instantiate()
		offer_button.anchor = anchor;
		hbox.add_child(offer_button);



func _on_button_button_down() -> void:
	for i in get_tree().get_nodes_in_group("remove_on_shop_refresh"):
		i.queue_free();
	_ready();
