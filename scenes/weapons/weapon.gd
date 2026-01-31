class_name Weapon
extends Node2D

@export var weapon_resource: WeaponResource
@export var shoot_sound: AudioStream

# 通用属性
@onready var pivot: Node2D = %Pivot
@onready var sprite: Sprite2D = %Sprite2D

# 远程属性
@onready var fire_position: Marker2D = %FirePosition

# 近战属性
@onready var cooldown: Timer = %Cooldown
@onready var slash: GPUParticles2D = %SlashParticle
@onready var animation_player: AnimationPlayer = %AnimationPlayer

func use_weapon() -> void:
	pass
