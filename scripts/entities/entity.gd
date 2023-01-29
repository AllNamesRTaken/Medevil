class_name Entity
extends KinematicBody2D

onready var sprite = $Sprite

var speed : float = 100.0
var jump_speed : float = -400.0
var gravity : float = 980.0
var velocity = Vector2()
var max_health : float = 100.0
var current_health: float = 100.0
var armor : float = 0.0
var max_mana : float = 100.0
var current_mana : float = 100.0

var abilities : Dictionary = {}
var active_ability : String = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	for name in active_abilities:
#		abilities.get(name).update(self, delta)
#	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_sprite_animation_finished():
	var anim_name = $Sprite.animation
	$StateMachine.animation_finished(anim_name)

func hit(amount: int):
	current_health = min(current_health + (amount * ((100.0 - armor) * 0.1)), max_health)

func heal(amount: int):
	current_health = min(current_health + amount, max_health)

func hurt(amount: int):
	current_health = max(current_health - amount, 0)

func increase_mana(amount: int):
	current_mana = min(current_mana + amount, max_mana)

func reduce_mana(amount: int):
	current_mana = max(current_mana - amount, 0)
	
func is_alive():
	return current_health > 0

func load_ability(name: String):
	var scene = load("res://scenes/abilities/" + name + "/" + name + ".tscn")
	var ability = scene.instance()
	add_child(ability)
	abilities[name] = ability
	return ability
	
func start_ability(name : String, msg : Dictionary = {}):
	if abilities.has(name):
		var ability = abilities.get(name)
		ability.start(self, msg)
		return ability
	return null

func update_ability(name: String, msg : Dictionary = {}):
	if abilities.has(name):
		abilities.get(name).update(self, msg)

func stop_ability(name : String, msg : Dictionary = {}):
	if abilities.has(name):
		abilities.get(name).stop(self, msg)

func ability_is_animating(name : String):
	if abilities.has(name):
		return abilities.get(name).is_animating
	return false

func ability_in_progress(name : String):
	if abilities.has(name):
		return abilities.get(name).in_progress
	return false
