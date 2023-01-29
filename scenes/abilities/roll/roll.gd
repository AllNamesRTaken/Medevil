extends Ability

func start(entity: Entity, _msg: Dictionary = {}):
	is_animating = true
	entity.sprite.play("roll")

func update(entity: Entity, _msg: Dictionary = {}):	
	entity.velocity.x = 0
	if entity.sprite.flip_h:
		entity.velocity.x -= entity.speed
	else:
		entity.velocity.x += entity.speed
	
func animation_finished(anim_name: String):
	if anim_name == "roll":
		is_animating = false
