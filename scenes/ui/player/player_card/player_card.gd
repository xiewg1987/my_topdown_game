class_name PlayerCard
extends TextureButton

@export var player_resource: PlayerResource: set = _set_player_resource

@onready var icon: TextureRect = %Icon


func _set_player_resource(value: PlayerResource) -> void:
	if not is_node_ready(): 
		await ready
	player_resource = value
	icon.texture = player_resource.icon
