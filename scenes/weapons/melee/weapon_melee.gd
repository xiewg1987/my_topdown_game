class_name WeaponMelee
extends Weapon


var can_use: bool

func _ready() -> void:
	cooldown.wait_time = weapon_resource.cooldown


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		use_weapon()


func use_weapon() -> void:
	if not can_use: return
	can_use = false
	cooldown.start()
	SFXPlayer.play(shoot_sound)
	animation_player.play("melee/slash")
	slash.global_rotation = pivot.global_rotation
	slash.emitting = true


func _on_cooldown_timeout() -> void:
	can_use = true
	animation_player.play("melee/idle")
