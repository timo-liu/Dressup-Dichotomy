extends Control



func _on_a_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		GodScript.switch_to_cutscene("Adrienne")


func _on_b_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		GodScript.switch_to_cutscene("Bdrienne")



func _on_c_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		GodScript.switch_to_cutscene("Cdrienne")
