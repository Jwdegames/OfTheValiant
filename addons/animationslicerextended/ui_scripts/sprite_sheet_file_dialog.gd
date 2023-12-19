@tool
extends EditorScript


class_name sprite_sheet_file_dialog

var file_dialog
var parent

func _init(parent_node: Node) -> void:
	self.parent = parent_node

func create_file_dialog():
	print("create file dialog called!")
	file_dialog = EditorFileDialog.new()
	parent.add_child(file_dialog)
	file_dialog.popup_centered(Vector2(700, 500)) # Giving the dialog a predefined size
	file_dialog.mode = EditorFileDialog.FILE_MODE_OPEN_FILE 
	file_dialog.access = EditorFileDialog.ACCESS_FILESYSTEM
	file_dialog.set_title("Select A Sprite Sheet")
	file_dialog.add_filter("*.png, *.jpg, *.jpeg", "Images")
	print("Added filter")
	file_dialog.connect("file_selected", on_file_selected, 0)
	print("Connected")
	print("end")

func on_file_selected(filename : String) :
	print(filename)
	parent.get_node("%spritesheet_texture").texture = load(filename)
	var label = parent.get_node("%spritesheet_label")
	label.clear()
	label.add_text(filename)
	if (file_dialog != null):
		file_dialog.queue_free() # Dialog has to be freed in order for the script to be called again.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
