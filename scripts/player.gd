extends Node

class_name player

var side: String
var faction: String
var resources: Dictionary = {} 
var color: Color
var units: Array[unit] = []
var buildings: Array[building] = []

# Creates a player with a set side, faction, color, as well as its starting resources
func _init(start_side: String, start_faction: String, start_resources: Dictionary, start_color: Color) -> void:
	self.side = start_side
	self.faction = start_faction 
	self.resources = start_resources 
	self.color = start_color
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
