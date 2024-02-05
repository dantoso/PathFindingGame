extends Node
class_name PieceManager

var _endLocation: PieceContainer = null
var _startLocation: PieceContainer = null

func hasStartPiece() -> bool:
	return _startLocation == null


func hasEndPiece() -> bool:
	return _endLocation == null


func setStartTo(container: PieceContainer) -> StartPiece:
	if _startLocation:
		_startLocation.piece = null
	
	_startLocation = container
	return StartPiece.new()


func setEndTo(container: PieceContainer) -> EndPiece:
	if _endLocation:
		_endLocation.piece = null
	
	_endLocation = container
	return EndPiece.new()


func deletePiece(piece: Piece) -> void:
	if piece is StartPiece:
		_startLocation = null
	elif piece is EndPiece:
		_endLocation = null


func startPathing() -> bool:
	if hasStartPiece() || hasEndPiece():
		return false
	
	# do pathing
	
	return true
