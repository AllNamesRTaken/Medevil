class_name FallState
extends EntityState

func enter(_msg := {}) -> void:
	.enter(_msg)
	ability = entity.start_ability("fall")
	
func update(_delta: float) -> StateMsg:
	return empty_state

func physics_update(_delta: float) -> StateMsg:
	if entity.is_on_floor():
		return StateMsg.new("Land")

	entity.update_ability("fall")

	return empty_state

