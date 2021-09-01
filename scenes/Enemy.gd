extends Area2D

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Enemy_area_entered(area):
	print("Been hit")
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
