extends Control

@export var score : int = 1

@onready var score_label = $WindowHead/Score

var starting_position : Vector2 = Vector2(67.0,311.0)
var car = preload("res://Controllers/circuit_car.tscn")
var fan = preload("res://Controllers/fan.tscn")
var number_of_cars = 0
var number_of_fans = 0
var car_cost = number_of_cars + 1
var marketing_cost = 5
var fan_cost = 50
var profit_per_finish = 1

func _ready() -> void:
	update_score()

func _on_area_2d_area_entered(area: Area2D) -> void:
	update_score(profit_per_finish)

func update_score(profit = 0):
	score += profit
	score_label.set_deferred("text","Current score: "+ str(score) + " ("+str(profit)+")")

func update_car_cost():
	number_of_cars += 1
	car_cost = number_of_cars + 1
	$Button.set_deferred("text", "Buy Car (" + str(car_cost) + "$)")

func update_marketing_cost():
	marketing_cost += 5
	$Button2.set_deferred("text", "Buy marketing (" + str(marketing_cost) + "$)")


func update_fan_cost():
	number_of_fans += 1
	if number_of_fans != 4:
		fan_cost += 50
		$Button3.set_deferred("text", "Buy fans (" + str(fan_cost) + "$)")
	else:
		fan_cost = 5000
		$Button3.set_deferred("text", "Buy fans (∞$)")

func _on_buy_pressed() -> void:
	if score >= car_cost:
		var car_instance = car.instantiate()
		add_child(car_instance)
		car_instance.position = starting_position
		update_score(-car_cost)
		update_car_cost()


func _on_marketing_pressed() -> void:
	if score >= marketing_cost:
		update_score(-marketing_cost)
		update_marketing_cost()
		profit_per_finish = 10
		await get_tree().create_timer(5).timeout
		profit_per_finish = 1


func _on_fans_pressed() -> void:
	if score >= fan_cost:
		if number_of_fans != 4:
			var fan_instance = fan.instantiate()
			add_child(fan_instance)
			place_fan(fan_instance)
			update_score(-fan_cost)
			update_fan_cost()
		else:
			$CenterContainer.set_deferred("visible",true)

func fan_cheers():
	update_score(10*number_of_fans*number_of_fans*profit_per_finish)

func place_fan(fan : Fan):
	match number_of_fans:
		0:
			fan.position = Vector2(135,135)
			fan.rotation = deg_to_rad(180)
			fan.happy_fan.connect(fan_cheers.bind())
			fan.apply_sprite(1)
		1:
			fan.position = Vector2(285,135)
			fan.rotation = deg_to_rad(180)
			fan.happy_fan.connect(fan_cheers.bind())
			fan.apply_sprite(2)
		2:
			fan.position = Vector2(435,135)
			fan.rotation = deg_to_rad(180)
			fan.happy_fan.connect(fan_cheers.bind())
			fan.apply_sprite(3)
		3:
			fan.position = Vector2(685,135)
			fan.rotation = deg_to_rad(180)
			fan.happy_fan.connect(fan_cheers.bind())
			fan.apply_sprite(4)


func _confirm_win() -> void:
	$CenterContainer.set_deferred("visible",false)
	$AudioStreamPlayer3D.play()
