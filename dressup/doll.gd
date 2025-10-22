class_name Doll
extends TextureRect

@export var outfit: Control

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if not data is Sticker:
		return false
	
	return true
	#var sticker: Sticker = data as Sticker
	#var top_left: Vector2 = sticker.lock_point - sticker.get_sticker_offset()
	#var bottom_right: Vector2 = sticker.lock_point + sticker.get_sticker_offset()
	#var hover_position: Vector2 = at_position * scale
	#var bounding_box: Rect2 = Rect2(top_left, bottom_right)
	#return bounding_box.has_point(hover_position)


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var sticker: Sticker = data as Sticker
	sticker.reparent(outfit)
	sticker.position = sticker.lock_point
