class_name JumpState
extends EntityState

func enter(_msg := {}) -> void:
	.enter(_msg)
	ability = entity.start_ability("jump")

func update(_delta: float) -> StateMsg:
	return empty_state

func physics_update(_delta: float) -> StateMsg:
	if ability.in_progress and entity.is_on_floor():
		return StateMsg.new("Land")

	if not ability.is_animating and not entity.is_on_floor():
		return StateMsg.new("Fall")

	if Input.is_action_pressed("melee_attack"):
		return StateMsg.new("MeleeAttack")

	entity.update_ability("jump")

	return empty_state

