@tool
extends EditorPlugin

var dock = preload("res://addons/animationslicerextended/animation_slicer_extended_dock.tscn")
var plugin = preload("res://addons/animationslicerextended/animation_slicer_extended_script.gd")
func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	dock = dock.instantiate()
	# Add the loaded scene to the docks.
	add_control_to_bottom_panel(dock, "Animation Slicer")
	# Add the inspector plugin
	add_inspector_plugin(plugin)
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_bottom_panel(dock)
	# Erase the control from the memory.
	dock.free()
	# Erase the plugin from memory
	remove_inspector_plugin(plugin)
	pass
