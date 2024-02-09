extends Piece
class_name WallPiece

func _init() -> void:
	self.color = Color.WHITE
	self.collisionLayer = 2
	self.collisionMask = 1
