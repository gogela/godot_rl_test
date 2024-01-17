extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	velocity.x=SPEED
	velocity.y=SPEED
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
#		if collision_info.get_collision_count()>1:
#			print('****')
#		var cols = []
#		for x in collision_info.get_collision_count():
#			cols.append(collision_info.get_collider(x).name)
#		if 'player' in cols:	
#			print('**:',cols)
#			translate(Vector3(0,1,0))
#			#put reward here
#		 
		velocity = velocity.bounce(collision_info.get_normal())
		velocity.y=0

#	move_and_slide()
