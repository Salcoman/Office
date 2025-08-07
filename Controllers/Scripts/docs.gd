extends Control

@onready var intro : VBoxContainer = $HBoxContainer/IntroContainer
@onready var sequence : ScrollContainer = $HBoxContainer/SequenceUIContainer
@onready var manager : ScrollContainer = $HBoxContainer/ManagementContainer


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


func hide_all_containers():
	intro.set_deferred("visible", false)
	sequence.set_deferred("visible", false)
	manager.set_deferred("visible", false)
