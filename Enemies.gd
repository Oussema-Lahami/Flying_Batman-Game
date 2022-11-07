extends RigidBody2D


export var min_speed = 150.0
export var max_speed = 250.0
export var speed = 500
export var fire_rate = 1.0

var fireBall = preload("res://firaBall.tscn")
var can_fire = true

func _ready():
	$AnimatedSprite.playing = true
	var enemie_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = enemie_types[randi() % enemie_types.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	


func _on_fire_timeout():
		var fireBall_instance = fireBall.instance()
		fireBall_instance.position = $firePoint.get_global_position()
		fireBall_instance.rotation_degrees = rotation_degrees
		fireBall_instance.apply_impulse(Vector2() , -Vector2(speed , 0).rotated(rotation))
		get_tree().get_root().add_child(fireBall_instance)
		
