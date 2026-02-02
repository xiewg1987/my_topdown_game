class_name Arena
extends Node2D


@export var arena_cursor: Texture2D
@export var level_resource: LevelResource


@onready var health_bar: TextureProgressBar = %HealthBar
@onready var mana_bar: TextureProgressBar = %ManaBar

var grid: Dictionary[Vector2i, LevelRoom] = {}
var start_room_coord: Vector2i
var end_room_coord: Vector2i


func _ready() -> void:
	Cursor.sprite.texture = arena_cursor
	EventBus.player.on_player_health_updated.connect(_on_player_health_updated)
	generate_level_layout()
	select_special_rooms()
	load_game_selection()


func generate_level_layout() -> void:
	var current_coord := Vector2i.ZERO
	var directions := [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]
	grid.clear()
	print("创建布局...")
	grid[current_coord] = null
	while grid.size() <= level_resource.num_rooms:
		if randf() > 0.5: 
			current_coord = grid.keys().pick_random()
		var random_direction = directions.pick_random()
		var next_coord = current_coord + random_direction
		var attempts = 0
		while grid.has(next_coord) and attempts < level_resource.num_rooms:
			random_direction =  directions.pick_random()
			next_coord = current_coord + random_direction
			attempts += 1
		if not grid.has(next_coord):
			grid[next_coord] = null
	print("布局已生成：：：--->", grid.keys())


func select_special_rooms() -> void:
	pass


func load_game_selection() -> void:
	var player_instance := Global.get_player_scene().instantiate() as Player
	add_child(player_instance)
	player_instance.weapon_controller.equip_weapon()


func _on_player_health_updated(current_health: float, max_health: float) -> void:
	health_bar.value = current_health / max_health
