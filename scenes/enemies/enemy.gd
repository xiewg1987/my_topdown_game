class_name Enemy
extends CharacterBody2D

const SPEED := 0.0

@export var hurt_sound: AudioStream

@onready var player_detector: Area2D = %PlayerDetector
@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite

var can_move: bool = true


func _physics_process(_delta: float) -> void:
	if not Global.player_ref ||  not can_move: return
	var direction = global_position.direction_to(Global.player_ref.global_position)
	velocity = direction * SPEED
	move_and_slide()
	rotate_enemy()


func rotate_enemy() -> void:
	if global_position.x > Global.player_ref.global_position.x:
		animated_sprite.flip_h = true
	elif  global_position.x < Global.player_ref.global_position.x:
		animated_sprite.flip_h = false


func _on_player_detector_body_entered(_body: Node2D) -> void:
	animated_sprite.play("die")
	await animated_sprite.animation_finished
	EventBus.enemy.emit_on_enemy_die()
	queue_free()
	
