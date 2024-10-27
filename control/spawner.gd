extends Node

@export_file var path;
@export var anchor:Node
var entity;

func _on_button_down() -> void:
	entity = load(path);
	if not anchor:
		anchor = get_parent();
	var new = entity.instantiate();
	print(new);
	anchor.add_child(new);
	call_deferred("queue_free");
