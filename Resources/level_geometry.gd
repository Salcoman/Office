extends Node3D

signal entered(body: Node3D)
signal exited(body: Node3D)

func _on_exit_area_body_entered(body: Node3D) -> void:
	entered.emit(body)


func _on_exit_area_body_exited(body: Node3D) -> void:
	exited.emit(body)
