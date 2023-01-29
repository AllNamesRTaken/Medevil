class_name Ability
extends Node

var is_animating : bool = false
var in_progress : bool = false

func start(_entity: Entity, _msg: Dictionary = {}):
	pass

func update(_entity: Entity, _msg: Dictionary = {}):
	pass

func stop(_entity: Entity, _msg: Dictionary = {}):
	pass

func animation_finished(anim_name: String):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
