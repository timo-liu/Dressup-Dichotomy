class_name DollBody
extends TextureRect

@export var outfit: Control
@onready var submitButton : TextureButton = $"../../../SubmitButton"

# DANGER: DO NOT SCALE THE BODY!!! If you must change the size, scale the
# parent the Base node.

# NOTE: No hitboxes. As long as the sticker is above some pixel on the body,
# it parents to the body. Uncomment the below code for a broken implementation.
# From what I can tell, at_position is the drop position LOCAL to the TextureRect.
# That is, Vector2(0, 0) is the top left of the TextureRect
# and Vector2(size.x, size.y) is the bottom right. 
# at_position is some value between those points. 
# Since "lock_point" is where the Sticker should snap to, build the hitbox
# around that.

func _process(delta: float) -> void:
	if check_outfit():
			submitButton.visible = true
	else:
		submitButton.visible = false

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return check_able_puton(data as Sticker)
	#var sticker: Sticker = data as Sticker
	#var top_left: Vector2 = sticker.lock_point - sticker.get_sticker_offset()
	#var bottom_right: Vector2 = sticker.lock_point + sticker.get_sticker_offset()
	#var hover_position: Vector2 = at_position * scale
	#var bounding_box: Rect2 = Rect2(top_left, bottom_right)
	#return bounding_box.has_point(hover_position)


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var sticker: Sticker = data as Sticker
	if check_able_puton(sticker):
		sticker.reparent(outfit)
		sticker.dollbody = self
		sticker.position = sticker.lock_point
		if check_outfit():
			submitButton.visible = true
		else:
			submitButton.visible = false
	
func check_outfit() -> bool:
	var checkTable = {}
	for i in GodScript.CLOTHING_GROUPS.values():
		checkTable[i] = false
	for child in outfit.get_children():
		if child is not Sticker:
			continue
		checkTable[GodScript.CLOTHING_GROUPS[child.clothing_category]] = true
	for cat in checkTable:
		if not checkTable[cat]:
			return false
	return true
		
func check_able_puton(curr_clothing : Sticker) -> bool:
	for child in outfit.get_children():
		if child.clothing_category == curr_clothing.clothing_category:
			return false
	return true


func _on_submit_button_pressed() -> void:
	for child in outfit.get_children():
		if child is not Sticker:
			continue
		if not child.correct:
			GodScript.switch_to_ending(false)
	GodScript.switch_to_ending(true)
