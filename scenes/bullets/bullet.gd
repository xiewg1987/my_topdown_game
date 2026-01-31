class_name Bullet
extends Area2D

var weapon_resource: WeaponResource


func setup(data: WeaponResource) -> void:
	weapon_resource = data


func _process(delta: float) -> void:
	if not weapon_resource: return
	move_local_x(weapon_resource.bullet_speed * delta)


func _on_body_entered(_body: Node2D) -> void:
	Global.create_explosion(global_position)
	queue_free()
