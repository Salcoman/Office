class_name Fan

extends Node2D


var blue_sprite = preload("res://Resources/Sprites/character_black_blue.png")
var green_sprite = preload("res://Resources/Sprites/character_black_green.png")
var red_sprite = preload("res://Resources/Sprites/character_black_red.png")
var white_sprite = preload("res://Resources/Sprites/character_black_white.png")

signal happy_fan

func apply_sprite(number):
	match number:
		1:
			$Sprite2D.set_deferred("texture",blue_sprite)
		2:
			$Sprite2D.set_deferred("texture",green_sprite)
		3:
			$Sprite2D.set_deferred("texture",red_sprite)
		4:
			$Sprite2D.set_deferred("texture",white_sprite)



func _on_area_2d_area_entered(area: Area2D) -> void:
	happy_fan.emit()
