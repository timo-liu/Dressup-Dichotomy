extends Area2D

@export var clothing_category : GodScript.ClothingCategory

func _ready() -> void:
	add_to_group(GodScript.CLOTHING_GROUPS[clothing_category])
