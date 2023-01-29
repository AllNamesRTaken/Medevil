extends Ability

var attack: int = 0

func start(entity: Entity, _msg: Dictionary = {}):
	is_animating = true
	attack = _msg.get("attack", 0)
	match attack:
		0: 
			entity.sprite.play("attack1")
		1: 
			entity.sprite.play("attack2")
		2: 
			entity.sprite.play("attack3")
		_: 
			entity.sprite.play("attack1")
	entity.velocity.x = 0

func update(entity: Entity, _msg: Dictionary = {}):
	if attack == 2:
		if entity.sprite.flip_h:
			entity.velocity.x = -entity.speed / 4.0
		else:
			entity.velocity.x = entity.speed / 4.0

func animation_finished(anim_name: String):
	match anim_name:
		"attack1":
			is_animating = false
		"attack2":
			is_animating = false
		"attack3":
			is_animating = false
