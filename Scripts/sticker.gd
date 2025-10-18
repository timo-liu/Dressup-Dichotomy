extends Control

var dragging : bool = false
var draggable : bool = true

func _ready():
	pass
	
func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - Vector2($TextureRect.size.x/2, $TextureRect.size.y/2)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and draggable and event.pressed:
		dragging = not dragging
		

func check_for_locks():
	pass
