class_name EntityState
extends State

# Typed reference to the player node.
var entity : Entity
var ability : Ability
var msg : Dictionary = {}

func _ready() -> void:
	# The states are children of the `Player` node so their `_ready()` callback will execute first.
	# That's why we wait for the `owner` to be ready first.
	yield(owner, "ready")
	# The `as` keyword casts the `owner` variable to the `Player` type.
	# If the `owner` is not a `Player`, we'll get `null`.
	entity = owner as Entity
	# This check will tell us if we inadvertently assign a derived state script
	# in a scene other than `Player.tscn`, which would be unintended. This can
	# help prevent some bugs that are difficult to understand.
	assert(entity != null)

func enter(_msg := {}) -> void:
	msg = _msg
	
func animation_finished(anim_name: String):
	if ability:
		ability.animation_finished(anim_name)

func exit():
	if ability:
		ability.stop(entity, msg)
