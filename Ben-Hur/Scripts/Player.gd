extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Class constants
const item = preload("res://Scripts/Item.gd")

# Movement variables
var screen_size

var speed

var d_free
var u_free
var l_free
var r_free

# Animation variables
var dir

# Player variables
var life
var shield
var strength

var bag # Bag is a 2d array and has to be given values such as [item, quantity]

var menu_on

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setting movement variables
	screen_size = get_viewport_rect().size
	
	speed = 400
	
	d_free = true
	u_free = true
	l_free = true
	r_free = true
	
	dir = Vector2(0, 0)
	
	# Setting player variables
	life = 30
	shield = 0
	
	bag = []
	
	menu_on = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if menu_on == false:
		if Input.is_action_pressed("move_down"):
			if d_free == true:
				velocity.y += 1
			dir.y = 1
		if Input.is_action_pressed("move_up"):
			if u_free == true:
				velocity.y -= 1
			dir.y = -1
		if Input.is_action_pressed("move_left"):
			if l_free == true:
				velocity.x -= 1
			dir.x = -1
		if Input.is_action_pressed("move_right"):
			if r_free == true:
				velocity.x += 1
			dir.x = 1
		
		if Input.is_action_just_released("move_down") or Input.is_action_just_released("move_up"):
			dir.y = 0
		if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
			dir.x = 0
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
	
	position += velocity * delta
	position.x = clamp(position.x, 40, screen_size.x - 40)
	position.y = clamp(position.y, 96, screen_size.y - 96)
	
	set_anim(dir)

func start(pos):
	position = pos
	show()
	$Down_CollisionShape2D.disabled = false
	$Up_CollisionShape2D.disabled = false
	$Left_CollisionShape2D.disabled = false
	$Right_CollisionShape2D.disabled = false


func set_anim(direc):
	match direc:
		Vector2(0, 0):
			$AnimatedSprite.animation = "move_down"
		Vector2(-1, 1):
			$AnimatedSprite.animation = "move_down"
		Vector2(0, 1):
			$AnimatedSprite.animation = "move_down"
		Vector2(1, 1):
			$AnimatedSprite.animation = "move_down"
		Vector2(-1, -1):
			$AnimatedSprite.animation = "move_up"
		Vector2(0, -1):
			$AnimatedSprite.animation = "move_up"
		Vector2(1, -1):
			$AnimatedSprite.animation = "move_up"
		Vector2(-1, 0):
			$AnimatedSprite.animation = "move_left"
		Vector2(1, 0):
			$AnimatedSprite.animation = "move_right"


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var shape = self.shape_owner_get_owner(local_shape_index)
	
	if shape == $Down_CollisionShape2D:
		d_free = false
	if shape == $Up_CollisionShape2D:
		u_free = false
	if shape == $Left_CollisionShape2D:
		l_free = false
	if shape == $Right_CollisionShape2D:
		r_free = false


func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	var shape = self.shape_owner_get_owner(local_shape_index)
	
	if shape == $Down_CollisionShape2D:
		d_free = true
	if shape == $Up_CollisionShape2D:
		u_free = true
	if shape == $Left_CollisionShape2D:
		l_free = true
	if shape == $Right_CollisionShape2D:
		r_free = true

func set_life(val):
	life = val

func get_life():
	return life


func set_shield(val):
	shield = val

func get_shield():
	return shield


func set_strenght(val):
	strength = val

func get_strength():
	return strength


func set_menu_on(val):
	menu_on = val


#func add_item(nm, stre, q):
#	var it = item.new()
#	
#	it.set_name(nm)
#	it.set_strength(stre)
#	
#	bag.append([it.get_name(), q])
#
#func remove_item(nm):
#	for i in range(0, bag.size()):
#		if bag[i][0].get_name() == nm:
#			bag.erase(bag[i])
#	# Theoretically, this works by iterating through the bag
#	# If one of its items name matches the given name, it erases that item
#	# Still have to figure out how I'm gonna make the player use items
#
#
#func use_item():
#	pass
