extends CharacterBody2D
var arah = "diam"
var speed = 150
var gravity = 850
var jump = -300

#serangan
var serangan = false
var attack_cooldown = 0.4
@onready var timer = Timer.new()
@onready var animasi = $AnimatedSprite2D
@onready var weapon_pivot = $WeaponPivot

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump
		
	if not serangan:
		run()
	else:
		velocity.x = 0
		move_and_slide()
	is_attack()

func _ready():
	var weapon_scene = preload("res://weapon_component.tscn")
	var weapon = weapon_scene.instantiate()
	weapon_pivot.add_child(weapon)
	
	timer.wait_time = attack_cooldown
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", Callable(self, "attack_end"))
	
# code attack
func is_attack():
	if Input.is_action_just_pressed("attack_btn"):
		serang()
		
func serang():
	serangan = true
	animasi.play("serang")
	timer.start()
	
func attack_end():
	serangan = false
	animasi.play("diam")

func run():
		
	if Input.is_action_pressed("ui_right"):
		arah = "kanan"
		arah_player(true)
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		arah = "kiri"
		arah_player(true)
		velocity.x = -speed
	else:
		velocity.x = 0
		arah_player(false)
	move_and_slide()
func arah_player(gerak):
	var arah_sekarang = arah
	
	if serangan:
		return
		
	if arah_sekarang == "kanan":
		animasi.flip_h = false
		if gerak:
			animasi.play("jalan")
		else:
			animasi.play("diam")
			
	if arah_sekarang == "kiri":
		animasi.flip_h = true
		if gerak:
			animasi.play("jalan")
		else:
			animasi.play("diam")
			
		
