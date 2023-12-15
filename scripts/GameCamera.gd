extends Camera2D

class_name game_camera

# Change types
var changeable: bool = false
var change_type: String = "Level"

# Bounding types
# Speed of the camera movement
@export var speed: float = 1000
@export var scroll_speed: Vector2 = Vector2(0.05, 0.05)
@export var max_zoom: Vector2 = Vector2(5, 5)
@export var min_zoom: Vector2 = Vector2(0.2, 0.2)



# Sets the limits of the camera
func set_limits(left_bound: float, right_bound: float, upper_bound: float, lower_bound: float) -> void:
	limit_left = left_bound
	limit_right = right_bound
	limit_top = upper_bound
	limit_bottom = lower_bound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_limits(-500, 3000, -500, 1000)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement: Vector2 = Vector2()
	var scroll_movement: Vector2 = Vector2()
	if Input.is_action_pressed("ui_right"):
		if movement.x < 0:
			movement.x = 0
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		if movement.x > 0:
			movement.x = 0
		movement.x -= 1
	if Input.is_action_pressed("ui_down"):
		if movement.y < 0:
			movement.y = 0
		movement.y += 1
	if Input.is_action_pressed("ui_up"):
		if movement.y > 0:
			movement.y = 0
		movement.y -= 1
	if Input.is_action_just_released("scroll_up"):
		zoom = clamp(zoom, min_zoom, max_zoom) + scroll_speed
	if Input.is_action_just_released("scroll_down"):
		zoom = clamp(zoom, min_zoom, max_zoom) - scroll_speed
	
	
	

	movement = movement.normalized() * speed * delta
	position += movement
	pass
	
