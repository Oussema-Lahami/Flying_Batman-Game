extends RigidBody2D

export var min_speed = 150.0
export var max_speed = 250.0



func _ready():
	$AnimatedSprite.playing = true
	var enemie_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = enemie_types[randi() % enemie_types.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

