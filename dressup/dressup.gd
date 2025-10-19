extends Control

@onready var dolls = {
	"Adrienne" : $DressupDoll/Adrienne,
	"Sonia" : $DressupDoll/Sonia,
	"Alastor" : $DressupDoll/Alastor
}

@onready var clothes = {
	"Adrienne" : [$Clothing/Tops/Adrienne, $Clothing/Bottoms/Adrienne, $Clothing/Shoes/Adrienne, $Clothing/Accessories/Adrienne],
	"Sonia" : [$Clothing/Tops/Sonia, $Clothing/Bottoms/Sonia, $Clothing/Shoes/Sonia, $Clothing/Accessories/Sonia],
	"Alastor" : [$Clothing/Tops/Alastor, $Clothing/Bottoms/Alastor, $Clothing/Shoes/Alastor, $Clothing/Accessories/Alastor]
}

func _ready() -> void:
	for d in dolls.keys():
		if d == GodScript.current_char:
			dolls[d].visible = true
			for c in clothes[d]:
				for child in c.get_children():
					child.visible = true
		else:
			dolls[d].visible = false
			for c in clothes[d]:
				for child in c.get_children():
					child.visible = true
	_update_visibility("tops")


func _update_visibility(category : String):
	var target
	for g in clothes[GodScript.current_char]:
		for s in g.get_children():
			if not s.on_body:
				s.visible = false
	$Clothing/Tops.z_index = 0
	$Clothing/Bottoms.z_index = 0
	$Clothing/Shoes.z_index = 0
	$Clothing/Accessories.z_index = 0
	if category == "tops":
		
		for s in clothes[GodScript.current_char][0].get_children():
			if not s.on_body:
				s.visible = true
		#$Clothing/Tops.z_index = 1
		target = $Clothing/Tops
	elif category == "bottoms":
		for s in clothes[GodScript.current_char][1].get_children():
			if not s.on_body:
				s.visible = true
		#$Clothing/Bottoms.z_index = 1
		target = $Clothing/Bottoms
	elif category == "shoes":
		for s in clothes[GodScript.current_char][2].get_children():
			if not s.on_body:
				s.visible = true
		#$Clothing/Shoes.z_index = 1
		target = $Clothing/Shoes
	elif category == "accessories":
		for s in clothes[GodScript.current_char][3].get_children():
			if not s.on_body:
				s.visible = true
		#$Clothing/Accessories.z_index = 1
		target = $Clothing/Accessories
	$Clothing.move_child(target, $Clothing.get_child_count() - 1)


func _on_tops_button_down() -> void:
	_update_visibility("tops")
	print("Clicked tops")


func _on_bottoms_button_down() -> void:
	_update_visibility("bottoms")
	print("Clicked bottoms")

func _on_shoes_button_down() -> void:
	_update_visibility("shoes")
	print("Clicked shoes")
	
func _on_accessories_button_down() -> void:
	_update_visibility("accessories")
	print("Clicked accs")
	
