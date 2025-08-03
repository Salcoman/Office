extends Node3D

@onready var menadzer = $menadzer
@onready var menadzer2 = $TheMenager
@onready var animation = $"TheMenager/funny manager with anims2/AnimationPlayer2"
@onready var player = $Player

func _ready() -> void:
	#menadzer.set_deferred("visible",true)
	animation.play("peek")
	player.listen_to_this("Da li si uneo Bullfrog u Salaryju")

func _physics_process(delta: float) -> void:
	pass
	menadzer.translate(Vector3(-1*delta,0,0))
