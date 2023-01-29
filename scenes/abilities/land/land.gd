extends Ability

func start(entity: Entity, _msg: Dictionary = {}):
	entity.sprite.play("land")
	is_animating = true

func update(entity: Entity, _msg: Dictionary = {}):
	entity.velocity.x = 0

func animation_finished(anim_name: String):
	if anim_name == "land":
		is_animating = false
