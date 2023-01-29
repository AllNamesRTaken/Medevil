class_name BlockState
extends EntityState

func enter(_msg := {}) -> void:
	.enter(_msg)
	ability = entity.start_ability("block")
	
func update(_delta: float) -> StateMsg:
	if not ability.is_animating and entity.is_on_floor():
		if Input.is_action_pressed("jump"):
			return StateMsg.new("Jump")
		elif Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
			return StateMsg.new("Run")
		elif Input.is_action_pressed("melee_attack"):
			return StateMsg.new("MeleeAttack")
		elif Input.is_action_pressed("block"):
			return StateMsg.new("Block")
		return StateMsg.new("Idle")
	return empty_state

func physics_update(_delta: float) -> StateMsg:
	entity.update_ability("block")
	
	return empty_state

