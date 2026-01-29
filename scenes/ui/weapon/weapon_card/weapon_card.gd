class_name WeaponCard
extends TextureButton

@export var weapon_resource: WeaponResource: set = _set_weapon_resource

@onready var icon: TextureRect = %Icon


func _set_weapon_resource(value: WeaponResource) -> void:
	if not is_node_ready(): 
		await ready
	weapon_resource = value
	icon.texture = weapon_resource.icon
