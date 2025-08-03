extends Control

var char_index = 0
var scroll_speed = 0.1 # Seconds per character
@onready var label = $PanelContainer/Label

@onready var full_text = label.text

signal done_reading

func _ready():
	set_process(true)


func scroll_text():
	while char_index < full_text.length():
		char_index += 1
		label.visible_characters += 1
		await get_tree().create_timer(scroll_speed).timeout
	done_reading.emit()

func read_to_player(text:String):
	label.text = text
	full_text = label.text
	scroll_text()
