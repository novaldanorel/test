extends Area2D

var parent = get_parent()
@export var width = 300
@export var height = 400
@export var damage = 10
@onready var hitbox = get_node("Hitbox_shape")
@onready var parentState = get_parent().selfState
