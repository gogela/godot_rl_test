extends StaticBody3D

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
	var floor_msh = MeshInstance3D.new()
	floor_msh.mesh = BoxMesh.new()
	floor_msh.mesh.size = Vector3(maxx,1,maxz)
	add_child(floor_msh)
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
func _process(_delta):
	pass
