class_name Bullet
extends Area2D

var weapon_resource: WeaponResource


func setup(data: WeaponResource) -> void:
	weapon_resource = data


func _process(delta: float) -> void:
	if not weapon_resource: return
	move_local_x(weapon_resource.bullet_speed * delta)


func _on_body_entered(body: Node2D) -> void:
	Global.create_explosion(global_position)
	Global.create_demage_text(weapon_resource.demage, body.global_position)
	queue_free()
