extends Node
class_name PieceManager

var _hasStart: = true
var _hasEnd: = true

static var main: = PieceManager.new():
	set(new_value):
		pass


func hasStartPiece() -> bool:
	return _hasStart


func hasEndPiece() -> bool:
	return _hasEnd


func setHasStart(val: bool):
	_hasStart = val


func setHasEnd(val: bool):
	_hasEnd = val
