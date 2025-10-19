extends Area2D

var dragging : bool = false
var draggable : bool = true
var hovering : bool = false
@export var clothing_category : String = ""
# This should be something like top, bottom, etc
@export var base_position : Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - Vector2($Texture.size.x/2, $Texture.size.y/2)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and draggable and event.pressed and hovering:
		if dragging:
			dragging = false
			check_for_locks()
		else:
			dragging = true
		

func check_for_locks():
	var bodies = get_overlapping_areas()
	print(bodies)
	for b in bodies:
		if b.is_in_group(clothing_category):
			position = b.position - Vector2($Texture.size.x/2, $Texture.size.y/2)
			print("locked")
			return
	position = base_position


func _on_texture_mouse_entered() -> void:
	hovering = true

func _on_texture_mouse_exited() -> void:
	hovering = false
