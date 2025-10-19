extends Area2D

@export var clothing_category : String

func _ready() -> void:
	add_to_group(clothing_category)
