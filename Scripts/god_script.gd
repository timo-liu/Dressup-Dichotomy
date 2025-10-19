extends Node

enum ClothingCategory {SHIRT, PANTS, SHOES, ACCESSORIES}

const CLOTHING_GROUPS = {
	ClothingCategory.SHIRT: "shirt",
	ClothingCategory.PANTS: "pants",
	ClothingCategory.SHOES: "shoes",
	ClothingCategory.ACCESSORIES: "accessories"
}

var dialogues = { 
	"Adrienne" : [["PLAYER","Hello child I am beholding you"],
	["PLAYER","Oh dear lord I am being observed"],
	["CHARACTER","Fear not. You have been s bbbpared"],
	["PLAYER","Thank the heavens"]],
	"Sonia" : ["hello poopyha"],
	"Astor" : ["hello poopyhaha"],
	"PLAYER" : [["PLAYER", "My whole life, I've been interested in fashion."],
["PLAYER", "It's always been a way for me to express myself and show others who I am without saying a word."],
["PLAYER" , "But I realized that, sometimes, people's appearances contradict their inner selves."],
["PLAYER" , "This incongruence between outer appearance and inner personality is the cause of distress for a lot of people."],
["PLAYER" , "And that's where I come in!"],
["PLAYER" , "As a style consultant, it's my job to help people dress in a way that makes them comfortable and represents them."],
["PLAYER" , "Today, I've got three clients."],
["PLAYER" , "Let me give it my best!"]]

}

var current_char : String = "Adrienne"

func switch_to_dressup():
	get_tree().change_scene_to_file("res://dressup/dressup.tscn")

func switch_to_cutscene(character : String):
	current_char = character
	get_tree().change_scene_to_file("res://dressup/cutscene.tscn")

func switch_to_select():
	get_tree().change_scene_to_file("res://dressup/select_character.tscn")
