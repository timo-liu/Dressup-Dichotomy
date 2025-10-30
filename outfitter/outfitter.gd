@tool
class_name Outfitter
extends Node

# Assumption: 
# SceneTree in outfitter.tscn:
# Doll (Scale this one if necessary, note its value)
# > Outfit (DO NOT SCALE)
# > Base (DO NOT SCALE)
# > > Body (DO NOT SCALE)
# > > Hair (DO NOT SCALE)
# SceneTree in dressup.tscn:
# Doll (DO NOT SCALE)
# > Outfit (DO NOT SCALE)
# > Base (Set the same scale to what you scaled Doll in outfitter.tscn)
# > > Body (DO NOT SCALE)
# > > Hair (DO NOT SCALE)


# Step 1: Make sure your SceneTree looks like above.
# Step 2: Drag in your LockPoint texture. 
# This will be the texture of the exported Sticker.
# (It also provides the visual from which you use to place the Sticker onto
# the base)
# Step 3: Click the "Place LockPoint" button
# Step 4: Define the "Node Name", the name of the Sticker node
# Step 5: Define the "Correctness"
# Step 6: Define the "Clothing Category". Under the hood, this also adjusts the 
# z-index/layering (Feel free to click "Force Update Layering" if the layering
# does not adjust properly)
# Step 7: Adjust the Sticker's position such that it is positioned correctly 
# on the doll

@export var doll: Control
@export var outfit: Control
@export var sticker_scene: PackedScene

@export_tool_button("Place LockPoint") var create_texture_rect_action = create_texture_rect
@export var lock_point: TextureRect
@export_tool_button("Force Update Layering") var force_update_layering_action = force_update_layering
@export_category("File Properties")
@export var sticker_folder: String
@export var sticker_file_name: String

@export_category("Sticker Properties")
@export var sticker_node_name: String
@export var correct: bool
@export var clothing_category: GodScript.ClothingCategory:
	set(new_clothing_category):
		lock_point.z_index = clothing_category_to_z_index(new_clothing_category)
		clothing_category = new_clothing_category
	get:
		return clothing_category
@export_tool_button("Create Sticker") var create_sticker_action = create_sticker

@export_category("LockPoint Properties")
@export var lock_point_texture: Texture :
	get :
		return lock_point_texture
	set(value):
		var base = value.load_path.get_file().split(".png")[0]
		base = base.replace(".imported/", "").replace(".godot/imported/", "")
		sticker_file_name = base
		var parts = base.split("_")
		var pascal_name = ""
		for part in parts:
				if part.length() > 0:
					pascal_name += part.substr(0, 1).to_upper() + part.substr(1).to_lower()
					sticker_node_name = pascal_name
		lock_point_texture = value

func create_texture_rect():
	var texture_rect: TextureRect = TextureRect.new()
	texture_rect.texture = lock_point_texture
	outfit.add_child(texture_rect)
	texture_rect.name = "LockPoint"
	texture_rect.owner = get_tree().edited_scene_root
	lock_point = texture_rect


func force_update_layering():
	lock_point.z_index = clothing_category_to_z_index(clothing_category)


func create_sticker():
	var scene: PackedScene = PackedScene.new()
	var new_sticker: Sticker = Sticker.new()
	
	new_sticker.name = sticker_node_name
	new_sticker.lock_point = lock_point.position * doll.scale
	new_sticker.scale = doll.scale
	#new_sticker.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	#new_sticker.size = lock_point.size
	
	new_sticker.texture = lock_point.texture
	new_sticker.correct = correct
	new_sticker.clothing_category = clothing_category
	new_sticker.z_index = lock_point.z_index
	scene.pack(new_sticker)
	
	var file_path: String = sticker_folder + sticker_file_name + ".tscn"
	var data: Error = ResourceSaver.save(scene, file_path)
	print(error_string(data))
	new_sticker.queue_free()
	lock_point.queue_free()


# Layer Order:
# 5. accessory
# 4. hair
# 3. shirt
# 2. skirt
# 1. shoes
# Higher z-indexes show up over lower z-indexes
func clothing_category_to_z_index(new_clothing_category: GodScript.ClothingCategory) -> int:
	match new_clothing_category:
		GodScript.ClothingCategory.SHOES:
			return 1
		GodScript.ClothingCategory.PANTS:
			return 2
		GodScript.ClothingCategory.SHIRT:
			return 3
		GodScript.ClothingCategory.ACCESSORIES:
			return 5
	return 0
