class_name Notebook
extends TabContainer

@export var tops_tab: StickerTab
@export var bottoms_tab: StickerTab
@export var shoes_tab: StickerTab
@export var accessories_tab: StickerTab


func _on_accessories_button_pressed() -> void:
	accessories_tab.visible = true


func _on_shoes_button_pressed() -> void:
	shoes_tab.visible = true


func _on_bottoms_button_pressed() -> void:
	bottoms_tab.visible = true


func _on_tops_button_pressed() -> void:
	tops_tab.visible = true
