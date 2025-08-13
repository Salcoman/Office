extends Control

@onready var intro : VBoxContainer = $HBoxContainer/IntroContainer
@onready var sequence : ScrollContainer = $HBoxContainer/SequenceUIContainer
@onready var manager : ScrollContainer = $HBoxContainer/ManagementContainer
@onready var exit : VBoxContainer = $HBoxContainer/ExitContainer
@onready var items : ItemList = $HBoxContainer/DocsList
@onready var escape_icon : Texture2D = preload("res://Resources/UI/Icons/door.png")

func _ready() -> void:
	var gui = get_parent().get_parent()
	gui.work_work.connect(_on_gui_work_work)

func _on_gui_work_work() -> void:
	items.add_item("Escape", escape_icon, true)

func _on_docs_list_item_selected(index: int) -> void:
	match index:
		0:
			hide_all_containers()
			intro.set_deferred("visible", true)
		1:
			hide_all_containers()
			sequence.set_deferred("visible", true)
		2:
			hide_all_containers()
			manager.set_deferred("visible", true)
		6:
			hide_all_containers()
			exit.set_deferred("visible", true)


func hide_all_containers():
	intro.set_deferred("visible", false)
	sequence.set_deferred("visible", false)
	manager.set_deferred("visible", false)
	exit.set_deferred("visible", false)
