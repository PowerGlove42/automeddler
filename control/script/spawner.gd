extends Node

@export_file var path;
@export var anchor:Node
var entity_owner:Node = self;
var entity;

func _on_button_down() -> void:
	spawn();

func spawn():
	entity = load(path);
	if not anchor:
		anchor = get_parent();
	var new = entity.instantiate();
	new.call_deferred("new_owner", entity_owner);
	anchor.add_child(new);
	call_deferred("queue_free");
