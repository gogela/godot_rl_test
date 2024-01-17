GDPC                �                                                                      $   d   res://.godot/exported/133200997/export-1222b1ceeacbc57c3f8fe0e4235d9be0-ExampleRaycastSensor3D.scn  �"      �      ���9�Ž�Dd�t���m    \   res://.godot/exported/133200997/export-1cc1ad7ce1f98ed0c4cee4b060bc26fd-RaycastSensor3D.scn  6      d      �"�����ѱ�
�rM    P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn��      ~      N�C�γ0�u��k�qw    \   res://.godot/exported/133200997/export-7454c66d21916090bf5dc7766fa8629a-RaycastSensor2D.scn �      �      �Î�si��rc�a`�c    `   res://.godot/exported/133200997/export-d1d9cc1906d18d9a32f853b74a4d90f4-RGBCameraSensor3D.scn   �<      �      ���6��|.�H"*j�    ,   res://.godot/global_script_class_cache.cfg  ��      "      Hb��dp��-ԟBo�@\    D   res://.godot/imported/icon.png-45a871b53434e556222f5901d598ab34.ctex�E      �       ��H�g~ @"�:SU�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex|      �      �Yz=������������       res://.godot/uid_cache.bin  ��      �      �0U\^�.��j�mH�    <   res://addons/godot_rl_agents/controller/ai_controller_2d.gd         �      ���x�����%bf�U�    <   res://addons/godot_rl_agents/controller/ai_controller_3d.gd �      �      ���J�R�2
e���^X    0   res://addons/godot_rl_agents/godot_rl_agents.gd pC            }f�<i�S�.��t��4    ,   res://addons/godot_rl_agents/icon.png.import�F      �       �ͭ��`���E �_%,    <   res://addons/godot_rl_agents/onnx/csharp/ONNXInference.cs   �             h�)ژ��@��ح\��@    @   res://addons/godot_rl_agents/onnx/csharp/SessionConfigurator.cs �             h�)ژ��@��ح\��@    <   res://addons/godot_rl_agents/onnx/wrapper/ONNX_wrapper.gd          �      ٲK.�yW�.�����    L   res://addons/godot_rl_agents/sensors/sensors_2d/ExampleRaycastSensor2D.tscn �      }      �1�M�E�}�E���	5    <   res://addons/godot_rl_agents/sensors/sensors_2d/ISensor2D.gd@      �       �����=�
h��؅��    D   res://addons/godot_rl_agents/sensors/sensors_2d/RaycastSensor2D.gd  @      �	      j�=B	��JxjC/)k39    L   res://addons/godot_rl_agents/sensors/sensors_2d/RaycastSensor2D.tscn.remap  `�      l       {�ڹ��w3V��q^    T   res://addons/godot_rl_agents/sensors/sensors_3d/ExampleRaycastSensor3D.tscn.remap   Ш      s       )|�*�5�'�W��Q    <   res://addons/godot_rl_agents/sensors/sensors_3d/ISensor3D.gdP%      �       �7U/劊����G��    D   res://addons/godot_rl_agents/sensors/sensors_3d/RGBCameraSensor3D.gdp;      [      ��EGiꇩ��2V�4    L   res://addons/godot_rl_agents/sensors/sensors_3d/RGBCameraSensor3D.tscn.remap��      n       ��C���hP�2��    D   res://addons/godot_rl_agents/sensors/sensors_3d/RaycastSensor3D.gd  P&      �      �V��u5iE��,���    L   res://addons/godot_rl_agents/sensors/sensors_3d/RaycastSensor3D.tscn.remap  P�      l       �Rُ�2��s�;�ok    $   res://addons/godot_rl_agents/sync.gdPG      �!      �=P�9s�
7��g4m       res://controller.gd �m            /p�'��y��t��R       res://floor.gd  �q      �      㤱Oá����U��Z       res://guard.gd  �x      F      ;��L���Nf%I��       res://icon.svg  Я      �      C��=U���^Qu��U3       res://icon.svg.import   ��      �       ���Eyq'�{AF�ŬA       res://main.tscn.remap   0�      a       �J�Sw� ������       res://player.gd @�            �iˇ���Y����G|I       res://project.binaryP�      �      J�� ��Q�΀*��    <   res://script_templates/AIController/controller_template.gd  �h             w����[ԫ$q{�~�        extends Node2D
class_name AIController2D

@export var reset_after := 1000

var heuristic := "human"
var done := false
var reward := 0.0
var n_steps := 0
var needs_reset := false

var _player: Node2D

func _ready():
	add_to_group("AGENT")
	
func init(player: Node2D):
	_player = player
	
#-- Methods that need implementing using the "extend script" option in Godot --#
func get_obs() -> Dictionary:
	assert(false, "the get_obs method is not implemented when extending from ai_controller") 
	return {"obs":[]}

func get_reward() -> float:	
	assert(false, "the get_reward method is not implemented when extending from ai_controller") 
	return 0.0
	
func get_action_space() -> Dictionary:
	assert(false, "the get get_action_space method is not implemented when extending from ai_controller") 
	return {
		"example_actions_continous" : {
			"size": 2,
			"action_type": "continuous"
		},
		"example_actions_discrete" : {
			"size": 2,
			"action_type": "discrete"
		},
		}
	
func set_action(action) -> void:	
	assert(false, "the get set_action method is not implemented when extending from ai_controller") 	
# -----------------------------------------------------------------------------#
	
func _physics_process(delta):
	n_steps += 1
	if n_steps > reset_after:
		needs_reset = true
		
func get_obs_space():
	# may need overriding if the obs space is complex
	var obs = get_obs()
	return {
		"obs": {
			"size": [len(obs["obs"])],
			"space": "box"
		},
	}

func reset():
	n_steps = 0
	needs_reset = false

func reset_if_done():
	if done:
		reset()
		
func set_heuristic(h):
	# sets the heuristic from "human" or "model" nothing to change here
	heuristic = h

func get_done():
	return done
	
func set_done_false():
	done = false

func zero_reward():
	reward = 0.0
	

              extends Node3D
class_name AIController3D

@export var reset_after := 1000

var heuristic := "human"
var done := false
var reward := 0.0
var n_steps := 0
var needs_reset := false

var _player: Node3D

func _ready():
	add_to_group("AGENT")
	
func init(player: Node3D):
	_player = player
	
#-- Methods that need implementing using the "extend script" option in Godot --#
func get_obs() -> Dictionary:
	assert(false, "the get_obs method is not implemented when extending from ai_controller") 
	return {"obs":[]}

func get_reward() -> float:	
#	assert(false, "the get_reward method is not implemented when extending from ai_controller") 
#	return 0.0
	return reward
	
func get_action_space() -> Dictionary:
	assert(false, "the get get_action_space method is not implemented when extending from ai_controller") 
	return {
		"example_actions_continous" : {
			"size": 2,
			"action_type": "continuous"
		},
		"example_actions_discrete" : {
			"size": 2,
			"action_type": "discrete"
		},
		}
	
func set_action(action) -> void:	
	assert(false, "the get set_action method is not implemented when extending from ai_controller") 	
# -----------------------------------------------------------------------------#
	
func _physics_process(delta):
	n_steps += 1
	if n_steps > reset_after:
		needs_reset = true
		
func get_obs_space():
	# may need overriding if the obs space is complex
	var obs = get_obs()
	return {
		"obs": {
			"size": [len(obs["obs"])],
			"space": "box"
		},
	}

func reset():
	n_steps = 0
	needs_reset = false

func reset_if_done():
	if done:
		reset()
		
func set_heuristic(h):
	# sets the heuristic from "human" or "model" nothing to change here
	heuristic = h

func get_done():
	return done
	
func set_done_false():
	done = false

func zero_reward():
	reward = 0.0

               
               extends Node
class_name ONNXModel
var inferencer_script = load("res://addons/godot_rl_agents/onnx/csharp/ONNXInference.cs")

var inferencer = null

# Must provide the path to the model and the batch size
func _init(model_path, batch_size):
	inferencer = inferencer_script.new()
	inferencer.Initialize(model_path, batch_size)

# This function is the one that will be called from the game, 
# requires the observation as an array and the state_ins as an int
# returns an Array containing the action the model takes. 
func run_inference(obs : Array, state_ins : int) -> Dictionary:
	if inferencer == null:
		printerr("Inferencer not initialized")
		return {}
	return inferencer.RunInference(obs, state_ins)
[gd_scene load_steps=5 format=3 uid="uid://ddeq7mn1ealyc"]

[ext_resource type="Script" path="res://sensors/sensors_2d/RaycastSensor2D.gd" id="1"]

[sub_resource type="GDScript" id="2"]
script/source = "extends Node2D



func _physics_process(delta: float) -> void:
    print(\"step start\")
    
"

[sub_resource type="GDScript" id="1"]
script/source = "extends RayCast2D

var steps = 1

func _physics_process(delta: float) -> void:
    print(\"processing raycast\")
    steps += 1
    if steps % 2:
        force_raycast_update()

    print(is_colliding())
"

[sub_resource type="CircleShape2D" id="3"]

[node name="ExampleRaycastSensor2D" type="Node2D"]
script = SubResource("2")

[node name="ExampleAgent" type="Node2D" parent="."]
position = Vector2(573, 314)
rotation = 0.286234

[node name="RaycastSensor2D" type="Node2D" parent="ExampleAgent"]
script = ExtResource("1")

[node name="TestRayCast2D" type="RayCast2D" parent="."]
script = SubResource("1")

[node name="StaticBody2D" type="StaticBody2D" parent="."]
position = Vector2(1, 52)

[node name="CollisionShape2D" type="CollisionShape2D" parent="StaticBody2D"]
shape = SubResource("3")
   extends Node2D
class_name ISensor2D

var _obs : Array = []
var _active := false

func get_observation():
	pass
	
func activate():
	_active = true
	
func deactivate():
	_active = false

func _update_observation():
	pass
	
func reset():
	pass
               @tool
extends ISensor2D
class_name RaycastSensor2D

@export_flags_2d_physics var collision_mask := 1:
	get: return collision_mask
	set(value):
		collision_mask = value
		_update()

@export var collide_with_areas := false:
	get: return collide_with_areas
	set(value):
		collide_with_areas = value
		_update()

@export var collide_with_bodies := true:
	get: return collide_with_bodies
	set(value):
		collide_with_bodies = value
		_update()

@export var n_rays := 16.0:
	get: return n_rays
	set(value):
		n_rays = value
		_update()
	
@export_range(5,200,5.0) var ray_length := 200:
	get: return ray_length
	set(value):
		ray_length = value
		_update()
@export_range(5,360,5.0) var cone_width := 360.0:
	get: return cone_width
	set(value):
		cone_width = value
		_update()
	
@export var debug_draw := true :
	get: return debug_draw 
	set(value):
		debug_draw = value
		_update()  


var _angles = []
var rays := []

func _update():
	if Engine.is_editor_hint():
		if debug_draw:
			_spawn_nodes()
		else:
			for ray in get_children():
				if ray is RayCast2D:
					remove_child(ray)

func _ready() -> void:
	_spawn_nodes()

func _spawn_nodes():
	for ray in rays:
		ray.queue_free()
	rays = []
		
	_angles = []
	var step = cone_width / (n_rays)
	var start = step/2 - cone_width/2
	
	for i in n_rays:
		var angle = start + i * step
		var ray = RayCast2D.new()
		ray.set_target_position(Vector2(
			ray_length*cos(deg_to_rad(angle)),
			ray_length*sin(deg_to_rad(angle))
		))
		ray.set_name("node_"+str(i))
		ray.enabled  = true
		ray.collide_with_areas = collide_with_areas
		ray.collide_with_bodies = collide_with_bodies
		ray.collision_mask = collision_mask
		add_child(ray)
		rays.append(ray)
		
		
		_angles.append(start + i * step)
	

func _physics_process(delta: float) -> void:
	if self._active:
		self._obs = calculate_raycasts()
		
func get_observation() -> Array:
	if len(self._obs) == 0:
		print("obs was null, forcing raycast update")
		return self.calculate_raycasts()
	return self._obs
	

func calculate_raycasts() -> Array:
	var result = []
	for ray in rays:
		ray.force_raycast_update()
		var distance = _get_raycast_distance(ray)
		result.append(distance)
	return result

func _get_raycast_distance(ray : RayCast2D) -> float : 
	if !ray.is_colliding():
		return 0.0
		
	var distance = (global_position - ray.get_collision_point()).length()
	distance = clamp(distance, 0.0, ray_length)
	return (ray_length - distance) / ray_length
	
	
	
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script C   res://addons/godot_rl_agents/sensors/sensors_2d/RaycastSensor2D.gd ��������      local://PackedScene_qnc8u :         PackedScene          	         names "         RaycastSensor2D    script    n_rays    Node2D    	   variants                      �A      node_count             nodes        ��������       ����                          conn_count              conns               node_paths              editable_instances              version             RSRC              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_dnsd5 �          PackedScene          	         names "         ExampleRaycastSensor3D    Node3D 	   Camera3D 
   transform    	   variants            �?              �?              �?��M?    ��,@      node_count             nodes        ��������       ����                      ����                    conn_count              conns               node_paths              editable_instances              version             RSRC        extends Node3D
class_name ISensor3D

var _obs : Array = []
var _active := false

func get_observation():
	pass
	
func activate():
	_active = true
	
func deactivate():
	_active = false

func _update_observation():
	pass
	
func reset():
	pass
               @tool
extends ISensor3D
class_name RayCastSensor3D
@export_flags_3d_physics var collision_mask = 1:
	get: return collision_mask
	set(value):
		collision_mask = value
		_update()
@export_flags_3d_physics var boolean_class_mask = 1:
	get: return boolean_class_mask
	set(value):
		boolean_class_mask = value
		_update()

@export var n_rays_width := 6.0:
	get: return n_rays_width
	set(value):
		n_rays_width = value
		_update()
	
@export var n_rays_height := 6.0:
	get: return n_rays_height
	set(value):
		n_rays_height = value
		_update()

@export var ray_length := 10.0:
	get: return ray_length
	set(value):
		ray_length = value
		_update()
		
@export var cone_width := 60.0:
	get: return cone_width
	set(value):
		cone_width = value
		_update()
		
@export var cone_height := 60.0:
	get: return cone_height
	set(value):
		cone_height = value
		_update()

@export var collide_with_areas := false:
	get: return collide_with_areas
	set(value):
		collide_with_areas = value
		_update()
		
@export var collide_with_bodies := true:
	get: return collide_with_bodies
	set(value):
		collide_with_bodies = value
		_update()

@export var class_sensor := false
		
var rays := []
var geo = null

func _update():
	if Engine.is_editor_hint():
		_spawn_nodes()	


func _ready() -> void:
	_spawn_nodes()

func _spawn_nodes():
	print("spawning nodes")
	for ray in get_children():
		ray.queue_free()
	if geo:
		geo.clear()
	#$Lines.remove_points()
	rays = []
	
	var horizontal_step = cone_width / (n_rays_width)
	var vertical_step = cone_height / (n_rays_height)
	
	var horizontal_start = horizontal_step/2 - cone_width/2
	var vertical_start = vertical_step/2 - cone_height/2   

	var points = []
	
	for i in n_rays_width:
		for j in n_rays_height:
			var angle_w = horizontal_start + i * horizontal_step
			var angle_h = vertical_start + j * vertical_step
			#angle_h = 0.0
			var ray = RayCast3D.new()
			var cast_to = to_spherical_coords(ray_length, angle_w, angle_h)
			ray.set_target_position(cast_to)

			points.append(cast_to)
			
			ray.set_name("node_"+str(i)+" "+str(j))
			ray.enabled  = true
			ray.collide_with_bodies = collide_with_bodies
			ray.collide_with_areas = collide_with_areas
			ray.collision_mask = collision_mask
			add_child(ray)
			ray.set_owner(get_tree().edited_scene_root)
			rays.append(ray)
			ray.force_raycast_update()
			
#    if Engine.editor_hint:
#        _create_debug_lines(points)
		
func _create_debug_lines(points):
	if not geo: 
		geo = ImmediateMesh.new()
		add_child(geo)
		
	geo.clear()
	geo.begin(Mesh.PRIMITIVE_LINES)
	for point in points:
		geo.set_color(Color.AQUA)
		geo.add_vertex(Vector3.ZERO)
		geo.add_vertex(point)
	geo.end()

func display():
	if geo:
		geo.display()
	
func to_spherical_coords(r, inc, azimuth) -> Vector3:
	return Vector3(
		r*sin(deg_to_rad(inc))*cos(deg_to_rad(azimuth)),
		r*sin(deg_to_rad(azimuth)),
		r*cos(deg_to_rad(inc))*cos(deg_to_rad(azimuth))       
	)
	
func get_observation() -> Array:
	return self.calculate_raycasts()

func calculate_raycasts() -> Array:
	var result = []
	for ray in rays:
		ray.set_enabled(true)
		ray.force_raycast_update()
		var distance = _get_raycast_distance(ray)
		result.append(distance)
		#JG code - detect ray colision with guard
		var guard_detected=0
		if ray.get_collider():
#			print(ray.get_collider().name)
			if ray.get_collider().name=='guard':
				guard_detected=1
		result.append(guard_detected)
			
#		if class_sensor:
#			var hit_class = 0 
#			if ray.get_collider():
#				var hit_collision_layer = ray.get_collider().collision_layer
#
#				hit_collision_layer = hit_collision_layer & collision_mask
#				hit_class = (hit_collision_layer & boolean_class_mask) > 0
#			result.append(hit_class)
		ray.set_enabled(false)
	return result

func _get_raycast_distance(ray : RayCast3D) -> float : 
	if !ray.is_colliding():
		return 0.0
		
	var distance = (global_transform.origin - ray.get_collision_point()).length()
	distance = clamp(distance, 0.0, ray_length)
	return (ray_length - distance) / ray_length
      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script C   res://addons/godot_rl_agents/sensors/sensors_3d/RaycastSensor3D.gd ��������      local://PackedScene_fab82 :         PackedScene          	         names "         RaycastSensor3D    script    n_rays_width    n_rays_height    ray_length    Node3D    @node_0 0@18991    target_position 
   RayCast3D 	   node_0 1    @node_1 0@18992    @node_1 1@18993    @node_2 0@18994    @node_2 1@18995    @node_3 0@18996    @node_3 1@18997    	   variants                      �@      @     0A   T��i56��A   T��i56@�A   ����i56�~�(A   ����i56@~�(A   ���?i56�~�(A   ���?i56@~�(A   T�@i56��A   T�@i56@�A      node_count    	         nodes     W   ��������       ����                                              ����                        	   ����                        
   ����                           ����                           ����                           ����      	                     ����      
                     ����                   conn_count              conns               node_paths              editable_instances              version             RSRC            extends Node3D
class_name RGBCameraSensor3D
var camera_pixels = null

@onready var camera_texture := $Control/TextureRect/CameraTexture as Sprite2D

func get_camera_pixel_encoding():
	return camera_texture.get_texture().get_data().data["data"].hex_encode()

func get_camera_shape()-> Array:
	return [$SubViewport.size[0], $SubViewport.size[1], 4]
     RSRC                    PackedScene            ��������                                                  ..    SubViewport 	   Camera3D    resource_local_to_scene    resource_name    viewport_path    script 	   _bundled       Script E   res://addons/godot_rl_agents/sensors/sensors_3d/RGBCameraSensor3D.gd ��������      local://ViewportTexture_ewwsk �         local://PackedScene_at8jv �         ViewportTexture                         PackedScene          	         names "         RGBCameraSensor3D    script    Node3D    RemoteTransform3D    remote_path    SubViewport    size    render_target_update_mode 	   Camera3D    near    Control    layout_mode    anchors_preset    anchor_right    anchor_bottom    TextureRect    offset_left    offset_top    offset_right    offset_bottom    scale    color 
   ColorRect    CameraTexture    texture    offset    flip_v 	   Sprite2D    	   variants                                 -                       ?           �?            �D    �D    @�D     
D
      A   A   �� <�� <�� <  �?          
     A  A            node_count             nodes     W   ��������       ����                            ����                           ����                                ����   	                  
   
   ����                                            ����                  	      
                                      ����                               conn_count              conns               node_paths              editable_instances              version             RSRC           @tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("Sync", "Node", preload("sync.gd"), preload("icon.png"))
	#add_custom_type("RaycastSensor2D2", "Node", preload("raycast_sensor_2d.gd"), preload("icon.png"))


func _exit_tree():
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.
	remove_custom_type("Sync")
	#remove_custom_type("RaycastSensor2D2")
               GST2            ����                        �   RIFF�   WEBPVP8L�   /��`�m�~��~�6�?�1g m�����cE���\�Q@ �+����SQ��88�a���;[�w�
#�m�tPV����"�?X	�;`&�� x�uHǅ��Fi�^��(�V��<ǲbkf���X�pM�4��w����J��^���            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dn7mfntm1bfv4"
path="res://.godot/imported/icon.png-45a871b53434e556222f5901d598ab34.ctex"
metadata={
"vram_texture": false
}
                extends Node
# --fixed-fps 2000 --disable-render-loop
@export_range(1, 10, 1, "or_greater") var action_repeat := 8
@export_range(1, 10, 1, "or_greater") var speed_up = 1
@export var onnx_model_path := ""

@onready var start_time = Time.get_ticks_msec()

const MAJOR_VERSION := "0"
const MINOR_VERSION := "3" 
const DEFAULT_PORT := "11008"
const DEFAULT_SEED := "1"
var stream : StreamPeerTCP = null
var connected = false
var message_center
var should_connect = true
var agents
var need_to_send_obs = false
var args = null
var initialized = false
var just_reset = false
var onnx_model = null
var n_action_steps = 0

var _action_space : Dictionary
var _obs_space : Dictionary

# Called when the node enters the scene tree for the first time.

func _ready():
	await get_tree().root.ready
	get_tree().set_pause(true) 
	_initialize()
	await get_tree().create_timer(1.0).timeout
	get_tree().set_pause(false) 
	
func _initialize():
	_get_agents()
	_obs_space = agents[0].get_obs_space()
	_action_space = agents[0].get_action_space()
	args = _get_args()
	Engine.physics_ticks_per_second = _get_speedup() * 60 # Replace with function body.
	Engine.time_scale = _get_speedup() * 1.0
	prints("physics ticks", Engine.physics_ticks_per_second, Engine.time_scale, _get_speedup(), speed_up)
	

	connected = connect_to_server()
	if connected:
		_set_heuristic("model")
		_handshake()
		_send_env_info()
	elif onnx_model_path != "":
		onnx_model = ONNXModel.new(onnx_model_path, 1)
		_set_heuristic("model")
	else:
		_set_heuristic("human")  
		
	_set_seed()
	_set_action_repeat()
	initialized = true  

func _physics_process(delta): 
	# two modes, human control, agent control
	# pause tree, send obs, get actions, set actions, unpause tree
	if n_action_steps % action_repeat != 0:
		n_action_steps += 1
		return

	n_action_steps += 1
	
	if connected:
		get_tree().set_pause(true) 
		
		if just_reset:
			just_reset = false
			var obs = _get_obs_from_agents()
		
			var reply = {
				"type": "reset",
				"obs": obs
			}
			_send_dict_as_json_message(reply)
			# this should go straight to getting the action and setting it checked the agent, no need to perform one phyics tick
			get_tree().set_pause(false) 
			return
		
		if need_to_send_obs:
			need_to_send_obs = false
			var reward = _get_reward_from_agents()
			var done = _get_done_from_agents()
			#_reset_agents_if_done() # this ensures the new observation is from the next env instance : NEEDS REFACTOR
			
			var obs = _get_obs_from_agents()
			
			var reply = {
				"type": "step",
				"obs": obs,
				"reward": reward,
				"done": done
			}
			_send_dict_as_json_message(reply)
		
		var handled = handle_message()
	
	elif onnx_model != null:
		var obs : Array = _get_obs_from_agents()
	
		var actions = []
		for o in obs:
			var action = onnx_model.run_inference(o["obs"], 1.0)
			action["output"] = clamp_array(action["output"], -1.0, 1.0)
			var action_dict = _extract_action_dict(action["output"])
			actions.append(action_dict)
		
		_set_agent_actions(actions) 
		need_to_send_obs = true
		get_tree().set_pause(false) 
		_reset_agents_if_done()	
		
	else:
		_reset_agents_if_done()	

func _extract_action_dict(action_array: Array):
	var index = 0
	var result = {}
	for key in _action_space.keys():
		var size = _action_space[key]["size"]
		if _action_space[key]["action_type"] == "discrete":
			result[key] = round(action_array[index])
		else:
			result[key] = action_array.slice(index,index+size)
		index += size
		
	return result

func _get_agents():
	agents = get_tree().get_nodes_in_group("AGENT")

func _set_heuristic(heuristic):
	for agent in agents:
		agent.set_heuristic(heuristic)

func _handshake():
	print("performing handshake")
	
	var json_dict = _get_dict_json_message()
	assert(json_dict["type"] == "handshake")
	var major_version = json_dict["major_version"]
	var minor_version = json_dict["minor_version"]
	if major_version != MAJOR_VERSION:
		print("WARNING: major verison mismatch ", major_version, " ", MAJOR_VERSION)  
	if minor_version != MINOR_VERSION:
		print("WARNING: minor verison mismatch ", minor_version, " ", MINOR_VERSION)
		
	print("handshake complete")

func _get_dict_json_message():
	# returns a dictionary from of the most recent message
	# this is not waiting
	while stream.get_available_bytes() == 0:
		stream.poll()
		if stream.get_status() != 2:
			print("server disconnected status, closing")
			get_tree().quit()
			return null

		OS.delay_usec(10)
		
	var message = stream.get_string()
	var json_data = JSON.parse_string(message)
	
	return json_data

func _send_dict_as_json_message(dict):
	stream.put_string(JSON.stringify(dict))

func _send_env_info():
	var json_dict = _get_dict_json_message()
	assert(json_dict["type"] == "env_info")

		
	var message = {
		"type" : "env_info",
		"observation_space": _obs_space,
		"action_space":_action_space,
		"n_agents": len(agents)
		}
	_send_dict_as_json_message(message)

func connect_to_server():
	print("Waiting for one second to allow server to start")
	OS.delay_msec(1000)
	print("trying to connect to server")
	stream = StreamPeerTCP.new()
	
	# "localhost" was not working on windows VM, had to use the IP
	var ip = "127.0.0.1"
	var port = _get_port()
	var connect = stream.connect_to_host(ip, port)
	print('connect:',connect)
	stream.set_no_delay(true) # TODO check if this improves performance or not
	stream.poll()
	# Fetch the status until it is either connected (2) or failed to connect (3)
	while stream.get_status() < 2:
		stream.poll()
	return stream.get_status() == 2

func _get_args():
	print("getting command line arguments")
	var arguments = {}
	for argument in OS.get_cmdline_args():
		print(argument)
		if argument.find("=") > -1:
			var key_value = argument.split("=")
			arguments[key_value[0].lstrip("--")] = key_value[1]
		else:
			# Options without an argument will be present in the dictionary,
			# with the value set to an empty string.
			arguments[argument.lstrip("--")] = ""

	return arguments   

func _get_speedup():
	print(args)
	return args.get("speedup", str(speed_up)).to_int()

func _get_port():    
	return args.get("port", DEFAULT_PORT).to_int()

func _set_seed():
	var _seed = args.get("env_seed", DEFAULT_SEED).to_int()
	seed(_seed)

func _set_action_repeat():
	action_repeat = args.get("action_repeat", str(action_repeat)).to_int()
	
func disconnect_from_server():
	stream.disconnect_from_host()



func handle_message() -> bool:
	# get json message: reset, step, close
	var message = _get_dict_json_message()
	if message["type"] == "close":
		print("received close message, closing game")
		get_tree().quit()
		get_tree().set_pause(false) 
		return true
		
	if message["type"] == "reset":
		print("resetting all agents")
		_reset_all_agents()
		just_reset = true
		get_tree().set_pause(false) 
		#print("resetting forcing draw")
#        RenderingServer.force_draw()
#        var obs = _get_obs_from_agents()
#        print("obs ", obs)
#        var reply = {
#            "type": "reset",
#            "obs": obs
#        }
#        _send_dict_as_json_message(reply)   
		return true
		
	if message["type"] == "call":
		var method = message["method"]
		var returns = _call_method_on_agents(method)
		var reply = {
			"type": "call",
			"returns": returns
		}
		print("calling method from Python")
		_send_dict_as_json_message(reply)   
		return handle_message()
	
	if message["type"] == "action":
		var action = message["action"]
		_set_agent_actions(action) 
		need_to_send_obs = true
		get_tree().set_pause(false) 
		return true
		
	print("message was not handled")
	return false

func _call_method_on_agents(method):
	var returns = []
	for agent in agents:
		returns.append(agent.call(method))
		
	return returns


func _reset_agents_if_done():
	for agent in agents:
		if agent.get_done(): 
			agent.set_done_false()

func _reset_all_agents():
	for agent in agents:
		agent.needs_reset = true
		#agent.reset()   

func _get_obs_from_agents():
	var obs = []
	for agent in agents:
		obs.append(agent.get_obs())

	return obs
	
func _get_reward_from_agents():
	var rewards = [] 
	for agent in agents:
		rewards.append(agent.get_reward())
		agent.zero_reward()
	return rewards    
	
func _get_done_from_agents():
	var dones = [] 
	for agent in agents:
		var done = agent.get_done()
		if done: agent.set_done_false()
		dones.append(done)
	return dones    
	
func _set_agent_actions(actions):
	for i in range(len(actions)):
		agents[i].set_action(actions[i])
	
func clamp_array(arr : Array, min:float, max:float):
	var output : Array = []
	for a in arr:
		output.append(clamp(a, min, max))
	return output
      # meta-name: AI Controller Logic
# meta-description: Methods that need implementing for AI controllers
# meta-default: true
extends _BASE_

#-- Methods that need implementing using the "extend script" option in Godot --#

func get_obs() -> Dictionary:
	assert(false, "the get_obs method is not implemented when extending from ai_controller") 
	return {"obs":[]}

func get_reward() -> float:	
	assert(false, "the get_reward method is not implemented when extending from ai_controller") 
	return 0.0
	
func get_action_space() -> Dictionary:
	assert(false, "the get get_action_space method is not implemented when extending from ai_controller") 
	return {
		"example_actions_continous" : {
			"size": 2,
			"action_type": "continuous"
		},
		"example_actions_discrete" : {
			"size": 2,
			"action_type": "discrete"
		},
		}
	
func set_action(action) -> void:	
	assert(false, "the get set_action method is not implemented when extending from ai_controller") 	
# -----------------------------------------------------------------------------#

#-- Methods that can be overridden if needed --#

#func get_obs_space() -> Dictionary:
# May need overriding if the obs space is complex
#	var obs = get_obs()
#	return {
#		"obs": {
#			"size": [len(obs["obs"])],
#			"space": "box"
#		},
#	}extends AIController3D

# Stores the action sampled for the agent's policy, running in python
#var move_action : float = 0.0
var action_turn : float = 0.0
var action_walk : float =0.0


#func get_obs() -> Dictionary:
#	# get the balls position and velocity in the paddle's frame of reference
#	var ball_pos = to_local(_player.ball.global_position)
#	var ball_vel = to_local(_player.ball.linear_velocity)
#	var obs = [ball_pos.x, ball_pos.z, ball_vel.x/10.0, ball_vel.z/10.0]
#
#	return {"obs":obs}

var obs = [0,0,0,0,0,0,0,0,0,0,0,0]

func get_obs():
	return {
		"obs":obs
	}

func get_reward() -> float:	
	return reward
	
func get_action_space() -> Dictionary:
	return {
		"action_turn" : {
			"size": 1,
			"action_type": "continuous"
		},
		"action_walk" : {
			"size": 1,
			"action_type": "continuous"
		},
		}
	
func set_action(action) -> void:	
	#move_action = clamp(action["move_action"][0], -1.0, 1.0)
	action_turn = clamp(action["action_turn"][0], -1.0, 1.0)
	action_walk = clamp(action["action_walk"][0], -1.0, 1.0)
            extends StaticBody3D

var maxx=20
var maxz=20
var walls=20

# Called when the node enters the scene tree for the first time.

func make_wall(pos):
	var wall_block = MeshInstance3D.new()
	wall_block.mesh = BoxMesh.new()
	wall_block.mesh.size = Vector3(1,2,1)
	wall_block.transform.origin = pos
	add_child(wall_block)
	var wall_col_shape = CollisionShape3D.new()
	wall_col_shape.shape = BoxShape3D.new()
	wall_col_shape.transform.origin = pos
	add_child(wall_col_shape)

func _ready():
#make floor
	var floor = MeshInstance3D.new()
	floor.mesh = BoxMesh.new()
	floor.mesh.size = Vector3(maxx,1,maxz)
	add_child(floor)
	var floor_cs = CollisionShape3D.new()
	floor_cs.shape = BoxShape3D.new()
	floor_cs.shape.size = Vector3(maxx,1,maxz)
	add_child(floor_cs)
	#random wall blocks
#	for x in range(walls):
#		var randx=randi() % (maxx+1) - maxx/2
#		var randz=randi() % (maxz+1) - maxz/2
#		make_wall(Vector3(randx, 1, randz))
	#wall around
	for x in maxx:
		make_wall(Vector3(x-maxx/2,1,maxz/2))
		make_wall(Vector3(x-maxx/2,1,-maxz/2))
	for z in maxz:
		make_wall(Vector3(maxx/2,1,z-maxz/2))
		make_wall(Vector3(-maxx/2,1,z-maxz/2))
		
#	#random rooms  - random centerpoint not too close to the edge
	var randx=(randi() % (maxx*2/3)) +3 
	var randz=(randi() % (maxz*2/3)) +3
	print([randx,randz])
	for x in maxx:
		if x ==randx/2 or x==((maxx-randx)/2+randx) or randi()%3!=0:
			print('x:',x)
			pass #door
		else:
			make_wall(Vector3(x-maxx/2,1,randz-maxz/2))
		
	for z in maxz:
		if z ==randz/2 or z==((maxz-randz)/2+randz) or randi()%3!=0:
			print('z:',z)
			pass #door
		else:
			make_wall(Vector3(randx-maxx/2,1,z-maxz/2))
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
        extends CharacterBody3D


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
          GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cmh7yehlts0ql"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    PackedScene            ��������                                            {      resource_local_to_scene    resource_name    custom_solver_bias    margin    radius    height    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radial_segments    rings    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance 	   _bundled       Script    res://floor.gd ��������   Script    res://player.gd ��������   Script    res://controller.gd ��������   Script C   res://addons/godot_rl_agents/sensors/sensors_3d/RaycastSensor3D.gd ��������   Script    res://guard.gd ��������   Script %   res://addons/godot_rl_agents/sync.gd ��������      local://CapsuleShape3D_3huif �         local://CapsuleMesh_fmeu4 �      !   local://StandardMaterial3D_eyjss          local://CapsuleShape3D_gq36b S         local://CapsuleMesh_hqx8s r      !   local://StandardMaterial3D_v1o2c �         local://PackedScene_7dgfs �         CapsuleShape3D             CapsuleMesh             StandardMaterial3D            �?���>s� >  �?         CapsuleShape3D             CapsuleMesh             StandardMaterial3D          ���=���>  �?  �?         PackedScene    z      	         names "   "      main    Node3D    floor 
   transform    script    StaticBody3D    DirectionalLight3D    shadow_enabled    player    CharacterBody3D    CollisionShape3D    shape    MeshInstance3D    mesh 	   skeleton    surface_material_override/0    AIController3D    RayCastSensor3D    n_rays_width    n_rays_height    cone_width    cone_height    class_sensor    @RayCast3D@18009    target_position 
   RayCast3D 	   node_2 0 	   node_2 1 	   Marker3D 	   Camera3D    fov    guard    Sync    Node    	   variants            �?              �?              �?    ���                   �?            j�4=+�?    +��j�4=    @A               �?              �?              �?۫=                    ��L?            ��L?            ��L?    Ǻ�?                   �?              �?              �?    �P�?                                           �?              �?              �?    �S�?                  @@      @     �A   �
2%\_?&dA   ��?\_�>PA   ��?\_?>PA   ӥ�H����i?} i��o?K �>��p����y˝����@��?@       ��_�1�> �W��O��G;F?[}	?��j?A��>E䦻F��R��Aղ��     �B     �?              �?              �?  A      A                                                   node_count             nodes     �   ��������       ����                      ����                                  ����                           	      ����                          
   
   ����                                ����            	      
                          ����                          ����                                                              ����                          ����                          ����                           ����                          ����                           	      ����                          
   
   ����                          ����                           !       ����                   conn_count              conns               node_paths              editable_instances              version             RSRC  extends CharacterBody3D


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
	var obs = raycast_sensor.calculate_raycasts()
	ai_controller.obs=obs
	if obs[1]+obs[3]+obs[5]+obs[7]+obs[9]+obs[11]>1:
		ai_controller.reward+=0.01 #give small rward for spotting the guard ?
	
   [remap]

path="res://.godot/exported/133200997/export-7454c66d21916090bf5dc7766fa8629a-RaycastSensor2D.scn"
    [remap]

path="res://.godot/exported/133200997/export-1222b1ceeacbc57c3f8fe0e4235d9be0-ExampleRaycastSensor3D.scn"
             [remap]

path="res://.godot/exported/133200997/export-1cc1ad7ce1f98ed0c4cee4b060bc26fd-RaycastSensor3D.scn"
    [remap]

path="res://.godot/exported/133200997/export-d1d9cc1906d18d9a32f853b74a4d90f4-RGBCameraSensor3D.scn"
  [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               list=Array[Dictionary]([{
"base": &"Node2D",
"class": &"AIController2D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/controller/ai_controller_2d.gd"
}, {
"base": &"Node3D",
"class": &"AIController3D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/controller/ai_controller_3d.gd"
}, {
"base": &"Node2D",
"class": &"ISensor2D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/sensors/sensors_2d/ISensor2D.gd"
}, {
"base": &"Node3D",
"class": &"ISensor3D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/sensors/sensors_3d/ISensor3D.gd"
}, {
"base": &"Node",
"class": &"ONNXModel",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/onnx/wrapper/ONNX_wrapper.gd"
}, {
"base": &"Node3D",
"class": &"RGBCameraSensor3D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/sensors/sensors_3d/RGBCameraSensor3D.gd"
}, {
"base": &"ISensor3D",
"class": &"RayCastSensor3D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/sensors/sensors_3d/RaycastSensor3D.gd"
}, {
"base": &"ISensor2D",
"class": &"RaycastSensor2D",
"icon": "",
"language": &"GDScript",
"path": "res://addons/godot_rl_agents/sensors/sensors_2d/RaycastSensor2D.gd"
}])
              <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ��KS�gfK   res://addons/godot_rl_agents/sensors/sensors_2d/ExampleRaycastSensor2D.tscnUd9y1�tD   res://addons/godot_rl_agents/sensors/sensors_2d/RaycastSensor2D.tscn�����)K   res://addons/godot_rl_agents/sensors/sensors_3d/ExampleRaycastSensor3D.tscn��*[�� BD   res://addons/godot_rl_agents/sensors/sensors_3d/RaycastSensor3D.tscncv?җ��p%   res://addons/godot_rl_agents/icon.png�wp�C'N   res://icon.svgJ�M����F   res://main.tscn        ECFG      application/config/name         basic3d_w_RL   application/run/main_scene         res://main.tscn    application/config/features,   "         4.1    C#     Forward Plus       application/config/icon         res://icon.svg     dotnet/project/assembly_name         basic3d_w_RL   editor_plugins/enabled4   "      (   res://addons/godot_rl_agents/plugin.cfg            