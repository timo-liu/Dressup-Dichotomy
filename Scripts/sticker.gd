@tool
class_name Sticker
extends TextureRect

@export var lock_point: Vector2
@export var correct: bool
@export var clothing_category: GodScript.ClothingCategory

var dollbody : DollBody = null

func _get_drag_data(_at_position: Vector2) -> Variant:
	set_drag_preview(make_preview())
	return self

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if dollbody != null:
		return dollbody.check_able_puton(data as Sticker)
	else:
		return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if dollbody != null:
		dollbody._drop_data(at_position, data as Sticker)
	
	#var sticker: Sticker = data as Sticker
	#var top_left: Vector2 = sticker.lock_point - sticker.get_sticker_offset()
	#var bottom_right: Vector2 = sticker.lock_point + sticker.get_sticker_offset()
	#var hover_position: Vector2 = at_position * scale
	#var bounding_box: Rect2 = Rect2(top_left, bottom_right)
	#return bounding_box.has_point(hover_position)

func make_preview() -> Control:
	var control: Control = Control.new()
	var texture_rect: TextureRect = TextureRect.new()
	control.add_child(texture_rect)
	texture_rect.scale = scale
	texture_rect.texture = texture
	texture_rect.position = - get_sticker_offset()
	# Shows up over ALL clothing types
	control.z_index = 6
	return control


func get_sticker_offset() -> Vector2:
	return size * scale / 2
