class_name IdleState
extends EntityState

func enter(_msg := {}) -> void:
	.enter(_msg)
	ability = entity.start_ability("idle", msg)
	
func physics_update(_delta: float) -> StateMsg:
	if not entity.is_on_floor():
		return StateMsg.new("Fall")

	if Input.is_action_pressed("jump"):
		return StateMsg.new("Jump")
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return StateMsg.new("Run")
	elif Input.is_action_pressed("melee_attack"):
		var attack = 0
		if msg.has("attack"):
			attack = msg.get("attack")
		return StateMsg.new("MeleeAttack", {"attack": attack})
	elif Input.is_action_pressed("roll"):
		return StateMsg.new("Roll")
	elif Input.is_action_pressed("block"):
		return StateMsg.new("Block")

	entity.update_ability("idle")

	return empty_state

