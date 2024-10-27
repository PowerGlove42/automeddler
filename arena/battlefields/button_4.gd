extends Button

const based = preload("res://units/lancerlot.tscn");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	print("BUTTON!")
	var new = based.instantiate();
	print(new);
	get_parent().add_child(new);
