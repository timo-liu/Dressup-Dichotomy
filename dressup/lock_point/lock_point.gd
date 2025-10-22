class_name LockPoint
extends TextureRect

#var sticker_data: StickerData
#
#func init(new_sticker_data: StickerData):
	#position = new_sticker_data.lock_point
	#scale = new_sticker_data.scale
	#size = new_sticker_data.texture.get_size()
#
#
#func _get_drag_data(_position: Vector2):
	#set_drag_preview(make_preview())
	#return sticker_data
#
#
#func make_preview() -> Control:
	#var control: Control = Control.new()
	#var texture_rect: TextureRect = TextureRect.new()
	#control.add_child(texture_rect)
	#control.scale = scale
	#texture_rect.texture = sticker_data.texture
	#return control
#
#
#func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	#return data is StickerData
#
#
#func _drop_data(_at_position: Vector2, data: Variant) -> void:
	#var new_sticker_data: StickerData = data as StickerData
	#sticker_data = new_sticker_data
	#texture = sticker_data.texture
	#
