extends Piece
class_name StartPiece

func _init() -> void:
	self.color = Color.CRIMSON
	self.collisionMask = 2
	self.collisionLayer = 1
