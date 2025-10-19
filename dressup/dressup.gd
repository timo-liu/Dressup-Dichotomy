extends Control

@onready var dolls = {
	"Adrienne" : $Holder/DressupDoll/A,
	"Bdrienne" : $Holder/DressupDoll/B,
	"Cdrienne" : $Holder/DressupDoll/C
}

@onready var clothes = {
	"Adrienne" : $Holder/Clothing/A,
	"Bdrienne" : $Holder/Clothing/B,
	"Cdrienne" : $Holder/Clothing/C
}

func _ready() -> void:
	for d in dolls.keys():
		if d == GodScript.current_char:
			dolls[d].set_process(true)
			clothes[d].set_process(true)
		else:
			dolls[d].set_process(false)
			clothes[d].set_process(false)
