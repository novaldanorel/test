extends CharacterBody2D

var gravity = 850
var health = 10
@onready var animasi = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
