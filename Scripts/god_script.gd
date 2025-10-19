extends Node

var dialogues = {
	"Adrienne" : [["CHARACTER","Hello child I am beholding you"],
	["PLAYER","Oh dear lord I am being observed"],
	["CHARACTER","Fear not. You have been spared"],
	["PLAYER","Thank the heavens"]],
	"Sonia" : ["hello poopyha"],
	"Astor" : ["hello poopyhaha"]
}

var current_char : String = "Adrienne"

func switch_to_dressup():
	get_tree().change_scene_to_file("res://dressup/dressup.tscn")

func switch_to_cutscene(character : String):
	current_char = character
	get_tree().change_scene_to_file("res://dressup/cutscene.tscn")
