extends Control

@export var score : int = 5

@onready var score_label = $WindowHead/Score

var starting_position : Vector2 = Vector2(67.0,311.0)
var car = preload("res://Controllers/circuit_car.tscn")
var number_of_cars = 0
var car_cost = number_of_cars + 1

func _ready() -> void:
	update_score()

func _on_area_2d_area_entered(area: Area2D) -> void:
	score += 1
	update_score()

func update_score():
	score_label.set_deferred("text","Current score: "+ str(score))

func update_car_cost():
	number_of_cars += 1
	car_cost = number_of_cars + 1
	$Button.set_deferred("text", "Buy Car (" + str(car_cost) + "$)")

func _on_buy_pressed() -> void:
	if score > car_cost:
		score -= car_cost
		var car_instance = car.instantiate()
		add_child(car_instance)
		car_instance.position = starting_position
		update_car_cost()
		update_score()
