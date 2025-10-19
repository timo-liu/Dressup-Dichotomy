extends Control

@onready var character_text : RichTextLabel = $CharacterTextBox/CharacterText
@onready var player_text : RichTextLabel = $PlayerTextBox/PlayerText

@onready var sprites = {
	"Adrienne" : $Adrienne,
	"Sonia" : $Sonia,
	"Astor" : $Astor,
}

var current_character_sprite : AnimatedSprite2D

var typing_speed : float = 0.05
var typing_counter : float = 0.0
var typing : bool = false
var current_talker = "PLAYER"
var current_counter : int = 0

func _ready() -> void:
	if GodScript.current_char != "PLAYER":
		current_character_sprite = sprites[GodScript.current_char]
	begin_play()

func _process(delta: float) -> void:
	if typing:
		if current_talker == "PLAYER":
			if player_text.visible_characters < player_text.get_total_character_count():
				typing_counter += delta
				if typing_counter >= typing_speed:
					player_text.visible_characters += 1
					typing_counter = 0.0
			else:
				typing = false
		else:
			if character_text.visible_characters < character_text.get_total_character_count():
				typing_counter += delta
				if typing_counter >= typing_speed:
					character_text.visible_characters += 1
					typing_counter = 0.0
			else:
				typing = false
				current_character_sprite.stop()
			
func begin_play():
	var d = GodScript.dialogues[GodScript.current_char][current_counter]
	if d[0] == "PLAYER":
		player_text.text = d[1]
		player_text.visible_characters = 0
		current_talker = "PLAYER"
	else:
		current_character_sprite.play("talk")
		character_text.text = d[1]
		character_text.visible_characters = 0
		current_talker = "CHARACTER"
	typing = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT  and event.pressed:
		if typing:
			if current_talker == "PLAYER":
				player_text.visible_characters = player_text.get_total_character_count()
			else:
				character_text.visible_characters = character_text.get_total_character_count()
			typing = false
		else:
			current_counter += 1
			if current_counter < len(GodScript.dialogues[GodScript.current_char]):
				begin_play()
			else:
				if not GodScript.current_char == "PLAYER":
					GodScript.switch_to_dressup()
				else:
					GodScript.switch_to_select()
