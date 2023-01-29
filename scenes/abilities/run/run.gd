extends Ability

func start(entity: Entity, _msg: Dictionary = {}):
	entity.sprite.play("run")

func update(entity: Entity, _msg: Dictionary = {}):
	entity.velocity.x = 0

	if Input.is_action_pressed("move_right"):
		entity.velocity.x += entity.speed
	if Input.is_action_pressed("move_left"):
		entity.velocity.x -= entity.speed

	if entity.velocity.x > 0:
		entity.sprite.flip_h = false
	if entity.velocity.x < 0:
		entity.sprite.flip_h = true

func stop(entity: Entity, _msg: Dictionary = {}):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
