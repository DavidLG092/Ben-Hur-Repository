extends Object


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Guide variables
var type_guide

# Item variables
var name
var type
var strength # Named "strength" but can also be used to determine item effectiveness

# Called when the node enters the scene tree for the first time.
func _ready():
	type_guide = {
		1: "Armor",
		2: "Weapon",
		3: "Heal",
		4: "Misc",
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Item functions
func create_item(nm, tp, st):
	name = nm
	
	if tp in type_guide:
		type = tp
		
	if (st >= 0 and st <= 100) and st % 10 == 0:
		strength = st

func set_name(val):
	name = val

func get_name():
	return name


func set_type(val):
	if val in type_guide:
		type = val

func get_type():
	return type


func set_strength(val):
	if (val >= 0 and val <= 100) and val % 10 == 0:
		strength = val

func get_strength():
	return strength
