class_name LevelResource
extends Resource


@export var num_sub_levels := 4 ## 子层级
@export var num_rooms := 28 ## 房间数量
@export var room_size := Vector2i(384, 384) ## 房间大小
@export var room_scene: PackedScene ## 房间场景
@export var min_enemies_per_room := 5 ## 房间最大敌人
@export var max_enemies_per_room := 10 ## 房间最小敌人
@export var enemy_scenes: Array[PackedScene] ## 敌人场景
@export var store_resource: Array[LevelStoreResource] ## 商店资源
