class_name Player
extends CharacterBody2D

@export var player_resource: PlayerResource ## 玩家资源

@onready var visuais: Node2D = %Visuais ## 玩家视觉
@onready var player_animated_sprite: AnimatedSprite2D = %PlayerAnimatedSprite ## 玩家动画

var can_move: bool = true ## 移动判断
var movement: Vector2 ## 移动
var direction: Vector2 ## 移动向量


func _physics_process(_delta: float) -> void:
	if not can_move: return
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	rotate_player()
	if direction != Vector2.ZERO:
		movement = direction * player_resource.move_speed
		player_animated_sprite.play("move")
	else :
		movement = Vector2.ZERO
		player_animated_sprite.play("idle")
	velocity = movement
	move_and_slide()


func rotate_player() -> void:
	if direction != Vector2.ZERO:
		if direction == Vector2.LEFT:
			visuais.scale = Vector2(-1, 1)
		else :
			visuais.scale = Vector2(1, 1)
		
