extends Actor

onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer
onready var sound_jump = $Jump


func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		sound_jump.play()

	var direction = get_direction()
	
	flip_player(direction)
	
	velocity = calculate_move_velocity(velocity, direction, speed)
	velocity = move_and_slide(velocity, FLOOR_CONSTANT)
	
	if direction.x != 0 and is_on_floor():
		animation_player.play("move")
	else:
		animation_player.play("idle")


func flip_player(direction: Vector2) -> void:
	var x_dir = sign(direction.x)

	if x_dir == -1:
		 sprite.scale.x = 1
	if x_dir == 1: 
		 sprite.scale.x = -1


func get_direction() -> Vector2:
	return  Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)


func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	
	return new_velocity
