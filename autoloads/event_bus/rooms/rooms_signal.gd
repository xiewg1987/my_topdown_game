class_name RoomsSignal
extends Node

signal on_player_room_entered(room: LevelRoom)

func emit_on_player_room_entered(room: LevelRoom) -> void:
	on_player_room_entered.emit(room)
