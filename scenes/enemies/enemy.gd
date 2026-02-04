class_name Enemy
extends CharacterBody2D


@export var hurt_sound: AudioStream
@export var icon_particle: Texture
@export var max_health := 5.0
@export var collision_damage := 2.0
@export var chase_speed := 60.0
@export var move_speed := 40.0
@export var weapon: WeaponResource

@onready var player_detector: Area2D = %PlayerDetector
@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite
@onready var health_bar: ProgressBar = %HealthBar
@onready var health_component: HealthComponent = %HealthComponent
@onready var enemy_detector: Area2D = %EnemyDetector


var can_move: bool = true
var is_killed: bool = false


func _ready() -> void:
	health_bar.value = 1
	health_component.init_health(max_health)
	


func _physics_process(_delta: float) -> void:
	if not Global.player_ref ||  not can_move: return
	var direction = global_position.direction_to(Global.player_ref.global_position)
	for enemy in enemy_detector.get_overlapping_bodies():
		if enemy != self and enemy.is_inside_tree():
			var vector = global_position - enemy.global_position
			direction = 20 * vector.normalized() / vector.length()
	velocity = direction * chase_speed
	move_and_slide()
	rotate_enemy()


func rotate_enemy() -> void:
	if global_position.x > Global.player_ref.global_position.x:
		animated_sprite.flip_h = true
	elif  global_position.x < Global.player_ref.global_position.x:
		animated_sprite.flip_h = false


func enemy_daed() -> void:
	if is_killed: return
	is_killed = true
	Global.create_dead_particle(icon_particle, global_position)
	EventBus.enemy.emit_on_enemy_die()
	queue_free()

func _on_player_detector_body_entered(_body: Node2D) -> void:
	enemy_daed()


func _on_health_component_on_unit_damaged(_amount: float) -> void:
	health_bar.value = health_component.current_health / max_health
	animated_sprite.material = Global.Hit_MATERIAL
	await get_tree().create_timer(0.15).timeout
	animated_sprite.material = null

func _on_health_component_on_unit_dead() -> void:
	enemy_daed()
