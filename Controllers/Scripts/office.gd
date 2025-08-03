extends Node3D

@onready var menadzer = $menadzer
@onready var menadzer2 = $TheMenager
@onready var animation = $"TheMenager/funny manager with anims2/AnimationPlayer2"
@onready var audio = $"TheMenager/funny manager with anims2/AudioStreamPlayer3D"
@onready var player = $Player
@onready var izlazPolje = $IzadjiNapolje


var talking = false

func _ready() -> void:
	#menadzer.set_deferred("visible",true)
	$teren/Plafon.set_deferred("visible", true)
	animation.play("peek")
	player.listen_to_this("Have you finished entering temporal Grungal sequences? We don't want economy reality desynchronizing. Don't let me catch you slacking again!")
	#await get_tree().create_timer(15.0).timeout
	#animation.play_backwards("peek")
	


func _on_dialogue_box_next_letter() -> void:
	audio.play()


func _on_work_failed() -> void:
	menadzer2.set_deferred("visible",true)
	animation.play("peek")
	player.listen_to_this("Add failed scenario")


func _on_player_done_listening() -> void:
	animation.play_backwards("peek")
	await animation.animation_finished
	menadzer2.set_deferred("visible",false)


func _on_gui_work_work() -> void:
	menadzer2.set_deferred("visible",true)
	animation.play("peek")
	player.listen_to_this("Work faster, stop messing around and get on with it already.")


func _on_izadji_napolje_body_entered(body: Node3D) -> void:
	print("usao je "+body.name)
