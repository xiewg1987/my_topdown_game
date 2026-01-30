class_name DiscriptionPanel
extends Control

@onready var discription_label: Label = %DiscriptionLabel

var text: String: set = _set_text


func _set_text(value: String) -> void:
	text = value
	discription_label.text = text
