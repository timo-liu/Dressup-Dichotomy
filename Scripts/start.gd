extends Control

var SELECT_SCREEN : String = ""

func _on_start_button_pressed() -> void:
	GodScript.switch_to_cutscene("PLAYER")
