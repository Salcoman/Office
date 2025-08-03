extends Node3D

@onready var menadzer = $menadzer
@onready var menadzer2 = $TheMenager
@onready var animation = $"TheMenager/funny manager with anims2/AnimationPlayer2"
@onready var audio = $"TheMenager/funny manager with anims2/AudioStreamPlayer3D"
@onready var player = $Player


var talking = false

func _ready() -> void:
	#menadzer.set_deferred("visible",true)
	animation.play("peek")
	player.listen_to_this("Da li si uneo Bullfrog u Salaryju")
	talking = true
	audio.play()



func _on_player_done_listening() -> void:
	talking = false
	


func _on_dialogue_box_next_letter() -> void:
	audio.play()
