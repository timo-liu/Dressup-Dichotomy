@tool
class_name Sticker
extends TextureRect

@export var lock_point: Vector2
@export var correct: bool
@export var clothing_category: GodScript.ClothingCategory

func _get_drag_data(_at_position: Vector2) -> Variant:
	set_drag_preview(make_preview())
	return self


func make_preview() -> Control:
	var control: Control = Control.new()
	var texture_rect: TextureRect = TextureRect.new()
	control.add_child(texture_rect)
	texture_rect.scale = scale
	texture_rect.texture = texture
	texture_rect.position = - get_sticker_offset()
	control.z_index = 6
	return control


func get_sticker_offset() -> Vector2:
	return size * scale / 2
