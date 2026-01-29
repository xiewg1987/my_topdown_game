class_name PlayerCard
extends TextureButton

@export var hover_stream: AudioStream
@export var player_resource: PlayerResource: set = _set_player_resource

@onready var icon: TextureRect = %Icon



func _set_player_resource(value: PlayerResource) -> void:
	if not is_node_ready(): 
		await ready
	player_resource = value
	icon.texture = player_resource.icon


func _on_mouse_entered() -> void:
	SFXPlayer.play(hover_stream)
	DampedOscillator.animate(icon, "scale", randf_range(400, 450), randf_range(5, 10), randf_range(10, 15), 0.5)
