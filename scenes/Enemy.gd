extends Area2D

export var speed = 150
var move_direction = 0
onready var path_follow = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start():
	show()
	$CollisionShape2D.disabled = false

func _physics_process(delta):
	MovementLoop(delta)

func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
	var pos = path_follow.get_global_position()
	move_direction = (pos.angle_to_point(prepos) / PI)*180
