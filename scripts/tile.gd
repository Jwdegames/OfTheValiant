extends Sprite2D


class_name tile
# Position and size
var x_size: float = 100
var y_size: float = 100
var x_pos: float = 0
var y_pos: float = 0

# Basic tile properties
var type: String = "Grassland"
var aqueous_type: String = "Land"
var move_cost_legged: int = 2
var move_cost_tracked: int = 3
var move_cost_wheeled: int = 4

# Variables to prevent overlap via AI
# var unit_to_arrive
var unit_hp: float
var expected_damage: float

# Adjacent tiles and map properties
var upleft: tile = null
var left: tile = null
var downleft: tile = null
var upright: tile = null
var right: tile = null
var downright: tile = null
var map_x: int = 0
var map_y: int = 0
var adjacent: Array[tile]
	
@export var sprites: Dictionary

func _init(start_type: String, start_x: float, start_y: float, start_x_size: int, 
	start_y_size: int, start_sprites: Dictionary) -> void:
	self.sprites = start_sprites
	self.type = start_type
	set_position(Vector2(start_x, start_y))
	set_scale(Vector2(start_x_size, start_y_size))
	self.set_variation()
	
# Sets the variation of the sprite image
func set_variation() -> void:
	var sprite_array: Array = self.sprites[self.type][0]
	texture = sprite_array.pick_random()
	
	
# Sets the adjacent node, t, that is to the direction, dir, of this node.
func set_adjacent_single(t: tile, dir: String) -> void:
	match dir:
		"upleft":
			upleft = t
			if t != null:
				t.downright = self
		"upright":
			upright = t
			if t != null:
				t.downleft = self
		"right":
			right = t
			if t != null:
				t.left = self
		"downright":
			downright = t
			if t != null:
				t.upleft = self
		"downleft":
			downleft = t
			if t != null:
				t.upright = self
		"left":
			left = t
			if t != null:
				t.right = self

func set_adjacent_list() -> Array[tile]:
	var temp: Array[tile] = adjacent.duplicate()
	adjacent = []
	adjacent += [upleft, upright, right, downright, downleft, left]
	# Get rid of all null items
	temp.filter(func(item: tile) -> bool: return item == null)
	return temp
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
