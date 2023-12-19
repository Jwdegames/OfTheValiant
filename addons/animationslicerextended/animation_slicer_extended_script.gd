@tool
extends EditorInspectorPlugin




func _handles(object: Object) -> bool:
	print("Is 2d?", object is Sprite2D)
	return object is Sprite2D


