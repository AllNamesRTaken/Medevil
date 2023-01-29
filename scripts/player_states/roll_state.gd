class_name RollState
extends EntityState

func enter(_msg := {}) -> void:
	.enter(_msg)
	ability = entity.start_ability("roll")
	
func update(_delta: float) -> StateMsg:
	return empty_state

func physics_update(_delta: float) -> StateMsg:
	if not ability.is_animating:
		if not entity.is_on_floor():
			return StateMsg.new("Fall")
		if entity.is_on_floor():
			return StateMsg.new("Idle")

	return empty_state

