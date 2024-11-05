extends Node2D

func combine(unit0:Node, unit1:Node, unit2:Node) -> Node:
	var ret = unit0;
	unit1.goodbye();
	unit2.goodbye();
	unit0.level_up();
	return ret;


func _on_child_entered_tree(node: Node) -> void:
	call_deferred("check_child", node);

func check_child(node:Node):
	var count = [];
	for i in get_children():
		if i.current_level == node.current_level and i.type == node.type:
			count.push_back(i)
	if count.size() == 3:
		combine(node, count[0], count[1]);
		if node.current_level == 1:
			check_child(node);


func _on_check_button_toggled(toggled_on: bool) -> void:
	for i in get_children():
		if i.has_method("combat_mode"):
			i.combat_mode(toggled_on);
