extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# File variables
var path

# Called when the node enters the scene tree for the first time.
func _ready():
	path = "user://Files/bag.dat"
	var item = preload("res://Scripts/Item.gd").new()
	
	item.create_item("Armor", 1, 10)
	
	add_item(item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Item handling functions
func add_item(val):
	var lines = []
	var cur
	var item = str(val.get_name()) + "/" + str(val.get_type()) + "/" + str(val.get_strength())
	
	var did = false
	
	var file = File.new()
	
	file.open(path, File.READ)
	
	for i in range(0, 12):
		cur = file.get_line()
		if cur == "------":
			if did == false:
				lines.append(item)
				did = true
			else:
				lines.append(cur)
		else:
			lines.append(cur)
		
	file.close()
	
	file.open(path, File.WRITE)
	
	for i in range(0, 12):
		file.store_line(lines[i])
	
	file.close()


func remove_item():
	pass
