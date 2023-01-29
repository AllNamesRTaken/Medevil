extends Ability

func start(entity: Entity, _msg: Dictionary = {}):
	entity.sprite.play("jump")
	entity.velocity.y += entity.jump_speed
	is_animating = true

func update(entity: Entity, _msg: Dictionary = {}):
	entity.velocity.x = 0

	if Input.is_action_pressed("move_right"):
		entity.velocity.x += entity.speed
	if Input.is_action_pressed("move_left"):
		entity.velocity.x -= entity.speed

	if entity.velocity.x < 0:
		entity.sprite.flip_h = true
	if entity.velocity.x > 0:
		entity.sprite.flip_h = false
		
	in_progress = true

func stop(_entity: Entity, _msg: Dictionary = {}):
	pass

func animation_finished(anim_name: String):
	if anim_name == "jump_full":
		is_animating = false
