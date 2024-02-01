extends Area2D
class_name Tile

@export var side: = 40
@onready var children: = get_children()
@onready var polygon: = $Polygon2D

var shape: RectangleShape2D
var identifier: = Vector2.ZERO

func _ready() -> void:
	polygon.deactivate()
	
	for child in children:
		if child is CollisionShape2D:
			shape = RectangleShape2D.new()
			shape.size.x = side
			shape.size.y = side
			
			child.shape = shape


func _mouse_enter() -> void:
	polygon.activate()
	


func _mouse_exit() -> void:
	polygon.deactivate()


func clone() -> Tile:
	for child in children:
		var childClone: = child.duplicate()
		var clone = duplicate()
		clone.add_child(childClone)
		
		return clone
		
	return null
