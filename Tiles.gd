extends Node2D
class_name Grid

@onready var parent: = get_parent()
@onready var screen: = get_viewport_rect()
@onready var tileModel: Tile = $Tile

func _ready() -> void:
	remove_child(tileModel)
	
	var width: = screen.size.x
	var height: = screen.size.y
	
	var rows = height/tileModel.side + 1
	var columns = width/tileModel.side + 1
	
	addGrid(rows, columns)


func addGrid(rows: int, columns: int) -> void:
	for i in rows:
		for j in columns:
#			await get_tree().create_timer(0.01).timeout
			
			var pos: = Vector2.ZERO
			pos.x = tileModel.side/2 + tileModel.side*j
			pos.y = tileModel.side/2 + tileModel.side*i
			
			var clone: = tileModel.clone()
			
			if clone:
				clone.identifier = Vector2(j, i)
				clone.position = pos
				add_child(clone)












