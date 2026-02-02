class_name LevelRoom
extends Node2D


@onready var room_walls: Dictionary[Vector2i, TileMapLayer] = {
	Vector2i.UP: %WallsUp,
	Vector2i.DOWN: %WallsDown,
	Vector2i.LEFT: %WallsLeft,
	Vector2i.RIGHT: %WallsRight
}


func _ready() -> void:
	close_all_walls()


func open_well(direction: Vector2i) -> void:
	if not room_walls.has(direction): return
	room_walls[direction].enabled = false


func close_all_walls() -> void:
	for wall_key: Vector2i in room_walls:
		room_walls[wall_key].enabled = true
