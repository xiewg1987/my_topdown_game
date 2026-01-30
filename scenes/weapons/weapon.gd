class_name Weapon
extends Node2D

@export var weapon_resource: WeaponResource
@export var shoot_sound: AudioStream

@onready var sprite: Sprite2D = %Sprite2D
@onready var pivot: Node2D = %Pivot
@onready var fire_position: Marker2D = %FirePosition


func use_weapon() -> void:
	pass
