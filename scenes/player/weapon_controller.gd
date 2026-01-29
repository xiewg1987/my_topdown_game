class_name WeaponController
extends Node2D

var current_weapon: Weapon ## 当前武器
var target_position: Vector2  ## 发射位置


func _process(_delta: float) -> void:
	target_position = get_global_mouse_position()
	rotate_weapon()


func equip_weapon() -> void:
	var weapon_instance := Global.get_weapons_scene().instantiate() as Weapon
	add_child(weapon_instance)
	current_weapon = weapon_instance
	current_weapon.position.y = -8
	current_weapon.weapon_resource = Global.selected_weapon

func rotate_weapon() -> void:
	if not current_weapon: return
	current_weapon.pivot.look_at(target_position)
