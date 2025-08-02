extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer2.play("loop")
	#start_animation()


func start_animation():
	# Example using Tween for script-controlled animation
	var tween = create_tween().set_loops()
	tween.tween_property($".", "position:x", 67.0, 1).as_relative()
	#tween.tween_property($".", "position:y", 62.0, 1).as_relative()
	tween.tween_property($".", "rotation", 50, 1).as_relative()
	
	tween.tween_property($".", "position:x", 576.0, 1.5).as_relative()
	tween.tween_property($".", "position:y", 62.0, 1.5).as_relative()
	
	tween.tween_property($".", "position:x",1085.0, 1.5).as_relative()
	tween.tween_property($".", "position:y", 62.0, 1.5).as_relative()
	
	tween.tween_property($".", "position:x",1085.0, 1.0).as_relative()
	tween.tween_property($".", "position:y", 311.0, 1.0).as_relative()
	
	tween.tween_property($".", "position:x",1085.0, 1.0).as_relative()
	tween.tween_property($".", "position:y", 577.0, 1.0).as_relative()
	
	tween.tween_property($".", "position:x",576.0, 1.5).as_relative()
	tween.tween_property($".", "position:y", 577.0, 1.5).as_relative()
	
	tween.tween_property($".", "position:x",67.0, 1.5).as_relative()
	tween.tween_property($".", "position:y", 577.0, 1.5).as_relative()
	
	tween.tween_property($".", "position:x",67.0, 1.0).as_relative()
	tween.tween_property($".", "position:y",311.0, 1.0).as_relative()
