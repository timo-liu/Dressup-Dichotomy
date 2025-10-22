class_name StickerTab
extends TextureRect


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Sticker


func _drop_data(at_position: Vector2, data: Variant) -> void:
	var sticker: Sticker = data as Sticker
	sticker.reparent(self, false)
	sticker.global_position = global_position + at_position - sticker.get_sticker_offset()
	#sticker.position = position + at_position - (sticker.size * sticker.scale) / 2
