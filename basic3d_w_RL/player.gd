extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var raycast_sensor = $"RayCastSensor3D"
@onready var ai_controller = $"AIController3D"

@export var speed = 1
@export var rotation_speed = 1.5


var rotation_direction = 0
func get_input():
	if  ai_controller.heuristic=='human':
		rotation_direction = Input.get_axis("ui_left", "ui_right")
		velocity = transform.basis.x * Input.get_axis("ui_down", "ui_up") * speed
	else:
		rotation_direction = ai_controller.action_turn
		velocity = transform.basis.x * ai_controller.action_walk * speed	


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
#	if direction:
#		velocity.x = direction.x * SPEED
#		velocity.z = direction.z * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#		velocity.z = move_toward(velocity.z, 0, SPEED)


	get_input()
	rotation.y += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	move_and_slide()
	ai_controller.reward=-0.0001 # small - for each move, kinda zeroed for each step 
	for index in get_slide_collision_count():
		var c = get_slide_collision(index).get_collider()
		if c.name=='guard':
			print("guard hit") #make the reward hook here
			ai_controller.reward+=1000
			#TODO make the guard spawn elsewhere?
		else: #wall hit
			ai_controller.reward-=0.1 #avoid hitting wall
	var obs = raycast_sensor.calculate_raycasts()
	ai_controller.obs=obs
	if obs[1]+obs[3]+obs[5]+obs[7]+obs[9]+obs[11]>1:
		ai_controller.reward+=1 #give small rward for spotting the guard ?
	
