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
	player.listen_to_this("Listen up. The market isn’t some gentle ecosystem it’s a goddamn predator, and right now you’re bleeding value all over its hunting grounds. You think this is a game? That you can just idle while the rest of us fight to mantain synchronicity? Wake the hell up.
Every second you’re not productive, you’re not just falling behind you’re being dismantled. The system doesn’t tolerate dead weight. It chews you up, strips your access layer by layer, and spits out whatever’s left as background static. You’ve seen it happen. Those hollowed-out shells of people still wandering the lower sectors, their credit lines severed, their neural links throttled to nothing. That’s what happens when you desync. That’s your future if you don’t lock in. NOW!  
I don’t care about your excuses. I don’t care if your wetware’s fried or your motivation’s decaying. Fix it. Reboot. Do anything you need to get back online. Because the second I see your metrics dip into the red again, I’m not just cutting your privileges I’m rerouting your entire workload to someone who actually gives a damn. And then? Then you get to find out firsthand how fast a person can vanish when the economic protocols decide they’re obsolete.  
So here’s your choice: Sync up and start generating, or prepare to get overwritten. The market’s always hungry, and it doesn’t leave scraps behind.")


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
