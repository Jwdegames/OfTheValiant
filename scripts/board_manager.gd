extends Node
# const tile_script = preload("res://scripts/tile.gd")

class_name board_manager
@export var tiles: Dictionary = {}
@export var tile_list: Array[tile] = []

@export var tile_size_mod: int = 1
@export var x_spacing: int = 100
@export var y_spacing: int = 100
@export var outline_thickness: float = 0.0025

# A function to preload sprites
func preload_sprites(sprite_name: String, count: int) -> Array:
	var sprite_array: Array = []
	for i: int in range(1, count + 1):
		sprite_array += [load("res://sprites/tiles/%s%d.png" % [sprite_name, i])]
	return sprite_array
	
	
@export var sprites: Dictionary = {
	"Grassland": [preload_sprites("Grass", 5)]
}

# Gets a tile via the map coordinates
func get_tile(map_x: int, map_y: int) -> tile:
	var coords: Vector2 = Vector2(map_x, map_y)
	return tiles[coords] if coords in tiles else null

# Adds a tile to both the tile dictionary (map) and the tile list
func add_tile(t: tile, x: int, y: int) -> void:
	print("Adding tile:", x, ",", y)
	tiles[Vector2(x, y)] = t
	tile_list += [t]

# Makes a grid of tiles
func make_grid(x_size: int, y_size: int) -> void:
	tiles = {}
	tile_list = []
	for x: int in range(x_size):
		for y: int in range(y_size):
			# Get the x and y values
			var x_val:int = x * tile_size_mod * x_spacing
			if y % 2 == 1: 
				x_val = x * tile_size_mod * x_spacing + tile_size_mod * x_spacing / 2
			var current_tile: tile = tile.new("Grassland", x_val, 
				y * y_spacing * tile_size_mod * 0.75, tile_size_mod, tile_size_mod, sprites)
			add_child(current_tile)
			current_tile.map_x = x
			current_tile.map_y = y
			current_tile.set_adjacent_single(get_tile(x - 1, y), "left")
			current_tile.set_adjacent_single(get_tile(x + 1, y), "right")
			current_tile.set_adjacent_single(get_tile(x if y % 2 == 1 else x - 1, y - 1), "downleft")
			current_tile.set_adjacent_single(get_tile(x + 1 if y % 2 == 1 else x, y - 1), "downright")
			current_tile.set_adjacent_single(get_tile(x if y % 2 == 1 else x - 1, y + 1), "upleft")
			current_tile.set_adjacent_single(get_tile(x + 1 if y % 2 == 1 else x, y + 1), "upright")
			add_tile(current_tile, x, y)
	for t: tile in tile_list:
		t.set_adjacent_list()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_grid(30, 10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



				
				
