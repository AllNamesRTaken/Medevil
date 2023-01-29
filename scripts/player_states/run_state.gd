class_name RunState
extends EntityState

func enter(_msg := {}) -> void:
	.enter(_msg)
	ability = entity.start_ability("run")
	
func update(_delta: float) -> StateMsg:
	return empty_state

func physics_update(_delta: float) -> StateMsg:

	if not entity.is_on_floor():
		return StateMsg.new("Fall")

	if Input.is_action_pressed("jump"):
		return StateMsg.new("Jump")
	elif Input.is_action_pressed("melee_attack"):
		return StateMsg.new("MeleeAttack")
	elif Input.is_action_pressed("roll"):
		return StateMsg.new("Roll")
	elif Input.is_action_pressed("block"):
		return StateMsg.new("Block")

	entity.update_ability("run")
	
	if entity.velocity.x == 0:
		return StateMsg.new("Idle")

	return empty_state
