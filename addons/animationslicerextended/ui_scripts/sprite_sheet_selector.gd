@tool
extends Button



var file_dialog = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready!")
	self.pressed.connect(self._button_pressed)
	pass # Replace with function body.

func _button_pressed():
	print("Hello world!")
	if file_dialog == null:
		print("Created file dialog")
		file_dialog = sprite_sheet_file_dialog.new(self)
	file_dialog.create_file_dialog()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
