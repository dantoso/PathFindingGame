extends Area2D
class_name Tile

@export var side: = 40
@onready var children: = get_children()
@onready var polygon: Polygon2D = $Polygon2D
@onready var pieceContainer: PieceContainer = $PieceContainer

var shape: RectangleShape2D
var pieceManager: PieceManager

var identifier: = Vector2.ZERO

func _ready() -> void:
	polygon.deselectedState()
	
	for child in children:
		if child is CollisionShape2D:
			shape = RectangleShape2D.new()
			shape.size.x = side
			shape.size.y = side
			
			child.shape = shape


func _mouse_enter() -> void:
	polygon.selectedState()


func _mouse_exit() -> void:
	polygon.deselectedState()









