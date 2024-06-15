extends SubViewport

@onready var bounds: Array[CollisionShape2D] = [%Up, %Down, %Left, %Right]

var loaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_collision()
	loaded = true
	

func _on_size_changed():
	if not loaded:
		await ready
	set_collision()

func set_collision():
	var screen_size = get_visible_rect()
	bounds[0].shape.distance = -screen_size.size.y / 2
	bounds[1].shape.distance = -screen_size.size.y / 2
	bounds[2].shape.distance = -screen_size.size.x / 2
	bounds[3].shape.distance = -screen_size.size.x / 2
