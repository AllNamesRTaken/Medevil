class_name MeleeAttackState
extends EntityState

var attack : int = 0

func enter(_msg := {}) -> void:
	attack = _msg.get("attack", 0)
	.enter(_msg)
	ability = entity.start_ability("melee_attack_3", _msg)
	
func update(_delta: float) -> StateMsg:
	return empty_state

func physics_update(_delta: float) -> StateMsg:
	if not ability.is_animating:
		if entity.is_on_floor():
			if Input.is_action_pressed("jump"):
				return StateMsg.new("Jump")
			elif Input.is_action_pressed("melee_attack"):
				return StateMsg.new("MeleeAttack", {"attack": (attack + 1) % 3})
			elif Input.is_action_pressed("roll"):
				return StateMsg.new("Roll")
			elif Input.is_action_pressed("block"):
				return StateMsg.new("Block")
		return StateMsg.new("Idle", {"attack": (attack + 1) % 3})

	entity.update_ability("melee_attack_3")
	
	return empty_state


