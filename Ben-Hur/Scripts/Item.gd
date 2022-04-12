extends Object


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Item variables
var name
var type
var strength # Named "strength" but can also be used to determine item effectiveness

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_name(val):
	name = val

func get_name():
	return name


func set_type(val):
	type = val

func get_type():
	return type


func set_strength(val):
	strength = val

func get_strength():
	return strength
