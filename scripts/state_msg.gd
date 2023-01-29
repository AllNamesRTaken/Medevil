class_name StateMsg

var state_name : String = ""
var data : Dictionary = {}
func is_empty() -> bool:
	return state_name == ""

func _init(name: String = "", _data: Dictionary = {}):
	state_name = name
	data = _data
