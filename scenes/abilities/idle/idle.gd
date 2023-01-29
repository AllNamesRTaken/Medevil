extends Ability

func start(_entity: Entity, _msg: Dictionary = {}):
	_entity.velocity = Vector2.ZERO
	_entity.sprite.play("idle")

func update(_entity: Entity, _msg: Dictionary = {}):
	pass

func stop(_entity: Entity, _msg: Dictionary = {}):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
