class_name MainMenu
extends Control

const MAIN_TWEEN_TIME = 0.2 ## 主窗口补间时长
const SETTINGS_TWEEN_TIME = 0.3 ## 设置窗口补间时长

@onready var main_buttons: Control = %MainButtons ## 主窗口按钮组
@onready var settings_buttons: Control = %SettingsButtons ## 设置按钮组

@onready var play_button: TextureButton = %PlayButton ## 开始游戏按钮
@onready var settings_button: TextureButton = %SettingsButton ## 设置按钮
@onready var quit_button: TextureButton = %QuitButton ## 退出按钮

@onready var music_button: TextureButton = %MusicButton ## 音乐按钮
@onready var sfx_button: TextureButton = %SFXButton ## 音效按钮
@onready var window_button: TextureButton = %WindowButton ## 窗口按钮
@onready var back_button: TextureButton = %BackButton ## 返回按钮


var main_buttons_position: Vector2
var settings_buttons_position_x: float

func _ready() -> void:
	## 国际化配置
	TranslationServer.set_locale("zh")
	main_buttons_position = main_buttons.position
	settings_buttons_position_x = settings_buttons.position.x
	## 连接设置按钮按下信号
	settings_button.pressed.connect(_on_settings_button_pressed)
	## 连接设置按钮组返回信号
	back_button.pressed.connect(_on_back_button_pressed)


func _on_settings_button_pressed() -> void:
	var viewport_y := get_viewport_rect().size.y
	var tween := create_tween()
	tween.tween_property(main_buttons, "global_position:y", viewport_y, MAIN_TWEEN_TIME)
	tween.tween_interval(0.1)
	tween.tween_property(settings_buttons, "global_position:x", main_buttons_position.x, SETTINGS_TWEEN_TIME)


func _on_back_button_pressed() -> void:
	var tween := create_tween()
	tween.tween_property(settings_buttons, "global_position:x", settings_buttons_position_x, SETTINGS_TWEEN_TIME)
	tween.tween_interval(0.1)
	tween.tween_property(main_buttons, "global_position:y", main_buttons_position.y, MAIN_TWEEN_TIME)
	
