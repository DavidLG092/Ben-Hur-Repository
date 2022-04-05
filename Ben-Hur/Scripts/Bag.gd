extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Bag variables

var bag


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Setting up labels
	$Label_Bag.text = "BAG"
	$Label_Bag.rect_scale = Vector2(0.18, 0.18)
	$Label_Bag.rect_position = Vector2(-3.55, -27)
	$Label_Bag;.hide()
	
	$Label_Items.text
	$Label_Items.rect_scale = Vector2(0.15, 0.15)
	$Label_Items.rect_position = Vector2(-25, -18)
	$Label_Items.show()
	
	$Label_Items_2.text
	$Label_Items_2.rect_scale = Vector2(0.15, 0.15)
	$Label_Items_2.rect_position = Vector2(7.35, -18)
	$Label_Items_2.hide()
	
	$Label_Controls.text = "Z - USE  X - DELETE  C - BACK"
	$Label_Controls.rect_scale = Vector2(0.11, 0.11)
	$Label_Controls.rect_position = Vector2(-25, 22.5)
	$Label_Items_2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label_Items.text = str(check_existence())

func check_existence():
	bag = File.new()
	
	if bag.file_exists("user://Desktop//bag.txt") == true:
		bag.open("user://Desktop//bag.txt", File.READ)
	else:
		bag.open("user://Desktop//bag.txt", File.WRITE)
		bag.store_string("test")
		bag.close()
