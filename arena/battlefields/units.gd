extends Node2D

func combine(unit0:Node, unit1:Node, unit2:Node) -> Node:
	var ret = unit0;
	unit1.unit.goodbye();
	unit2.unit.goodbye();
	unit0.unit.level_up();
	#unit0.unit.drag.call_deferred("_ready");
	return ret;


func _on_child_entered_tree(node: Node) -> void:
	call_deferred("check_child", node);

func check_child(node:Node):
	var count = [];
	for i in get_children():
		if i.unit.current_level == node.unit.current_level and i.type == node.type:
			count.push_back(i)
	if count.size() == 3:
		combine(node, count[0], count[1]);
		if node.unit.current_level == 1:
			check_child(node);
