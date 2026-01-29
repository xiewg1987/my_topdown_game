class_name CharacterSelection
extends Control

const PLAYER_CARD_SCENE = preload("uid://dgc8bf1w5ksd2")
const WEAPON_CARD_SCENE = preload("uid://b0bypmafxdd7o")

@export var selection_cursor: Texture2D
@export var players: Array[PlayerResource]
@export var weapons: Array[WeaponsResource]

@onready var player_container: HBoxContainer = %PlayerContainer
@onready var weapon_container: HBoxContainer = %WeaponContainer


func _ready() -> void:
	Cursor.sprite.texture = selection_cursor
	clear_selection_items()
	load_selection_items()

## 清理初始化选项
func clear_selection_items() -> void:
	for item: Node in player_container.get_children():
		item.queue_free()
	for item: Node in weapon_container.get_children():
		item.queue_free()


## 加载选择项
func load_selection_items() -> void:
	for player_resource: PlayerResource in players:
		var player_card_instance := PLAYER_CARD_SCENE.instantiate() as PlayerCard
		player_container.add_child(player_card_instance)
		player_card_instance.player_resource = player_resource
	
	for weapon_resource: WeaponsResource in weapons:
		var weapons_card_instance := WEAPON_CARD_SCENE.instantiate() as WeaponCard
		weapon_container.add_child(weapons_card_instance)
		weapons_card_instance.weapon_resource = weapon_resource
