extends Control

var ugly_label_settings : LabelSettings = preload("res://Resources/ugly_label_settings.tres")
var ugly_label_settings_bad : LabelSettings = preload("res://Resources/ugly_label_settings_bad.tres")
var startTime : int = 0
var broj : float = 0
var preostaloVreme : float = 0
var has_work_failed : bool = false
var twenty_submissions_event : bool = true

signal work_failed
signal work_work

signal minimize_me

@onready var generated_number = $HBoxContainer/VBoxContainer/Label
@onready var generated_number2 = $HBoxContainer/VBoxContainer/Label2
@onready var generated_number3 = $HBoxContainer/VBoxContainer/Label3
@onready var generated_number4 = $HBoxContainer/VBoxContainer/Label4
@onready var generated_number5 = $HBoxContainer/VBoxContainer/Label5
@onready var generated_number6 = $HBoxContainer/VBoxContainer/Label6

@onready var input_field = $HBoxContainer/VBoxContainer2/LineEdit
@onready var input_field2 = $HBoxContainer/VBoxContainer2/LineEdit2
@onready var input_field3 = $HBoxContainer/VBoxContainer2/LineEdit3
@onready var input_field4 = $HBoxContainer/VBoxContainer2/LineEdit4
@onready var input_field5 = $HBoxContainer/VBoxContainer2/LineEdit5
@onready var input_field6 = $HBoxContainer/VBoxContainer2/LineEdit6

@onready var confirmation_box = $HBoxContainer/VBoxContainer3/Label
@onready var confirmation_box2 = $HBoxContainer/VBoxContainer3/Label2
@onready var confirmation_box3 = $HBoxContainer/VBoxContainer3/Label3
@onready var confirmation_box4 = $HBoxContainer/VBoxContainer3/Label4
@onready var confirmation_box5 = $HBoxContainer/VBoxContainer3/Label5
@onready var confirmation_box6 = $HBoxContainer/VBoxContainer3/Label6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startTime = $Vreme.time_left
	preostaloVreme = $Vreme.time_left
	randomize()
	
	generated_number.set_deferred("text", randi_range(100000000,999999999))
	generated_number2.set_deferred("text", randi_range(100000000,999999999))
	generated_number3.set_deferred("text", randi_range(100000000,999999999))
	generated_number4.set_deferred("text", randi_range(100000000,999999999))
	generated_number5.set_deferred("text", randi_range(100000000,999999999))
	generated_number6.set_deferred("text", randi_range(100000000,999999999)) 



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# MRTVO RACUNANJE VREMENA
	if has_work_failed == false:
		if preostaloVreme>0:
			preostaloVreme-=delta
			broj = (1 - preostaloVreme / startTime)*100
			$ProgressBar.value = broj
		else:
			$ProgressBar.value = 100
			preostaloVreme = startTime
			#has_work_failed = true
			work_failed.emit()
			
		

func _smanjiVreme(vredbnost: float) -> void:
	preostaloVreme-=vredbnost

func _on_button_pressed() -> void:
	if generated_number.text == input_field.text:
		confirmation_box.set_deferred("text", "Good.")
		confirmation_box.set_deferred("label_settings",ugly_label_settings)
		GlobalVariables.correct_submissions += 1
		generated_number.set_deferred("text", randi_range(100000000,999999999))
		_smanjiVreme(-5.0)
	else:
		confirmation_box.set_deferred("text", "Bad.")
		_smanjiVreme(15.0)
		confirmation_box.set_deferred("label_settings",ugly_label_settings_bad)
	
	if generated_number2.text == input_field2.text:
		confirmation_box2.set_deferred("text", "Good.")
		confirmation_box2.set_deferred("label_settings",ugly_label_settings)
		GlobalVariables.correct_submissions += 1
		generated_number2.set_deferred("text", randi_range(100000000,999999999))
		_smanjiVreme(-5.0)
	else:
		confirmation_box2.set_deferred("text", "Bad.")
		_smanjiVreme(15.0)
		confirmation_box2.set_deferred("label_settings",ugly_label_settings_bad)
	
	if generated_number3.text == input_field3.text:
		confirmation_box3.set_deferred("text", "Good.")
		confirmation_box3.set_deferred("label_settings",ugly_label_settings)
		GlobalVariables.correct_submissions += 1
		generated_number3.set_deferred("text", randi_range(100000000,999999999))
		_smanjiVreme(-5.0)
	else:
		confirmation_box3.set_deferred("text", "Bad.")
		_smanjiVreme(15.0)
		confirmation_box3.set_deferred("label_settings",ugly_label_settings_bad)
		
	if generated_number4.text == input_field4.text:
		confirmation_box4.set_deferred("text", "Good.")
		confirmation_box4.set_deferred("label_settings",ugly_label_settings)
		GlobalVariables.correct_submissions += 1
		generated_number4.set_deferred("text", randi_range(100000000,999999999))
		_smanjiVreme(-5.0)
	else:
		confirmation_box4.set_deferred("text", "Bad.")
		_smanjiVreme(15.0)
		confirmation_box4.set_deferred("label_settings",ugly_label_settings_bad)
		
	if generated_number5.text == input_field5.text:
		confirmation_box5.set_deferred("text", "Good.")
		confirmation_box5.set_deferred("label_settings",ugly_label_settings)
		GlobalVariables.correct_submissions += 1
		generated_number5.set_deferred("text", randi_range(100000000,999999999))
		_smanjiVreme(-5.0)
	else:
		confirmation_box5.set_deferred("text", "Bad.")
		_smanjiVreme(15.0)
		confirmation_box5.set_deferred("label_settings",ugly_label_settings_bad)
		
	if generated_number6.text == input_field6.text:
		confirmation_box6.set_deferred("text", "Good.")
		confirmation_box6.set_deferred("label_settings",ugly_label_settings)
		GlobalVariables.correct_submissions += 1
		generated_number6.set_deferred("text", randi_range(100000000,999999999))
		_smanjiVreme(-5.0)
	else:
		confirmation_box6.set_deferred("text", "Bad.")
		_smanjiVreme(15.0)
		confirmation_box6.set_deferred("label_settings",ugly_label_settings_bad)
	
	if GlobalVariables.correct_submissions >= 20 and twenty_submissions_event:
		work_work.emit()
		twenty_submissions_event = false
	
	
	input_field.text=""
	input_field2.text=""
	input_field3.text=""
	input_field4.text=""
	input_field5.text=""
	input_field6.text=""
	
	$Label.set_deferred("text", "Completed no. of entries: " + str(GlobalVariables.correct_submissions))
	
	


func _on_minimized_pressed() -> void:
	minimize_me.emit()
