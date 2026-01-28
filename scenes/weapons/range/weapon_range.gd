class_name WeaponRange
extends Weapon

const TILT_RANGE = 90 ## 武器翻转角度


var direction: Vector2

func _ready() -> void:
	sprite.texture = weapon_resource.icon


func _process(_delta: float) -> void:
	rotate_weapon()

func use_weapon() -> void:
	pass


func rotate_weapon() -> void:
	direction = get_global_mouse_position() - global_position
	# sprite引用在继承类
	sprite.flip_v = direction.x < 0
