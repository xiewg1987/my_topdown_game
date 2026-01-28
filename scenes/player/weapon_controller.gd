class_name WeaponController
extends Node2D

@onready var weapon_pistol: WeaponRange = %WeaponRangePistol

var current_weapon: Weapon ## 当前武器
var target_position: Vector2  ## 发射位置


func _ready() -> void:
	current_weapon = weapon_pistol


func _process(_delta: float) -> void:
	target_position = get_global_mouse_position()
	rotate_weapon()

func rotate_weapon() -> void:
	if not current_weapon: return
	current_weapon.pivot.look_at(target_position)
