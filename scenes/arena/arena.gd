class_name Arena
extends Node2D


@export var arena_cursor: Texture2D


@onready var health_bar: TextureProgressBar = %HealthBar
@onready var mana_bar: TextureProgressBar = %ManaBar


func _ready() -> void:
	Cursor.sprite.texture = arena_cursor
	EventBus.player.on_player_health_updated.connect(_on_player_health_updated)
	load_game_selection()

func load_game_selection() -> void:
	var player_instance := Global.get_player_scene().instantiate() as Player
	add_child(player_instance)
	player_instance.weapon_controller.equip_weapon()

func _on_player_health_updated(current_health: float, max_health: float) -> void:
	health_bar.value = current_health / max_health
