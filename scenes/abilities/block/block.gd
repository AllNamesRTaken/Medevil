extends Ability

func start(entity: Entity, _msg: Dictionary = {}):
	is_animating = true
	entity.sprite.play("block")

func update(entity: Entity, _msg: Dictionary = {}):
	entity.velocity.x = 0

func animation_finished(anim_name: String):
	if anim_name == "block":
		is_animating = false
