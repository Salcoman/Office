extends CharacterBody3D

@export_category("Camera Controls")
@export var MOUSE_SENSITIVITY := 0.5
@export var TILT_LOWER_LIMIT := deg_to_rad(-90.0)
@export var TILT_UPPER_LIMIT := deg_to_rad(90.0)
@export var CAMERA_CONTROLLER : Camera3D

@onready var cam = $Camera3D

var _mouse_input: bool = false
var _mouse_rotation : Vector3 
var _rotation_input: float
var _tilt_input : float
var _player_rotation : Vector3 
var _camera_rotation : Vector3 
var mouse = Vector2()
var HIGH_MOUSE_SPEED = 10
var LOW_MOUSE_SPEED = 2
var current_mouse_speed = HIGH_MOUSE_SPEED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event is InputEventMouseMotion:
		mouse = event.relative

func _unhandled_input(event: InputEvent) -> void:
	_mouse_input = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if _mouse_input:
		_rotation_input = -event.relative.x * MOUSE_SENSITIVITY
		_tilt_input = -event.relative.y * MOUSE_SENSITIVITY
		
		
const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _update_camera(delta) -> void:
	_mouse_rotation.x += _tilt_input * delta
	_mouse_rotation.x = clamp(_mouse_rotation.x,TILT_LOWER_LIMIT,TILT_UPPER_LIMIT)
	_mouse_rotation.y += _rotation_input * delta
	
	_player_rotation = Vector3(0.0,_mouse_rotation.y,0.0)
	_camera_rotation = Vector3(_mouse_rotation.x,0.0,0.0)
	
	CAMERA_CONTROLLER.transform.basis = Basis.from_euler(_camera_rotation)
	CAMERA_CONTROLLER.rotation.z = 0.0
	
	global_transform.basis = Basis.from_euler(_player_rotation)
	
	_rotation_input = 0.0
	_tilt_input = 0.0
	
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("switch_mouse"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			current_mouse_speed = LOW_MOUSE_SPEED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			current_mouse_speed = HIGH_MOUSE_SPEED
			
	#If mouse visible return(prevent movement)
	if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		return
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	rotation_degrees.y -= mouse.x * current_mouse_speed * delta
	cam.rotation_degrees.x -= mouse.y * current_mouse_speed * delta
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -80,80)
	if direction != Vector3.ZERO:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.y -= 9.8 * delta  # gravity
	#_update_camera(delta)
	move_and_slide()
	mouse = Vector2()
