class_name Loops extends Node2D

@export var spawn_count: int

@onready var camera_2d: Camera2D = $Camera2D

var diamond_scene = preload("res://loops/star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewportSize = get_viewport_rect().size
	var screenCenterPosition = camera_2d.get_screen_center_position()
	
	var leftOfScreen = screenCenterPosition.x - (viewportSize.x/2) / camera_2d.zoom.x
	var rightOfScreen = screenCenterPosition.x + (viewportSize.x/2) / camera_2d.zoom.x
	var topOfScreen = screenCenterPosition.y - (viewportSize.y/2) / camera_2d.zoom.x
	var bottomOfScreen = screenCenterPosition.y + (viewportSize.y/2) / camera_2d.zoom.x
	
	for i in spawn_count:
		var new_position = Vector2(randf_range(leftOfScreen, rightOfScreen), randf_range(topOfScreen, bottomOfScreen))

		var diamond: Node2D = diamond_scene.instantiate()
		diamond.set_position(new_position)
		diamond.set_scale(Vector2.ONE * randf_range(0.5, 1))

		add_child(diamond)
