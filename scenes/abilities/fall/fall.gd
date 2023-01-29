extends Ability

func start(entity: Entity, _msg: Dictionary = {}):
	entity.sprite.play("fall")

func update(entity: Entity, _msg: Dictionary = {}):
	if Input.is_action_pressed("move_right"):
		entity.sprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		entity.sprite.flip_h = true

