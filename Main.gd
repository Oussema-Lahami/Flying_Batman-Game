extends Node


export (PackedScene) var enemie_scene



func _ready():
	pass


func _process(delta):
	if (OS.get_ticks_msec() > 10000):
		$Timer.wait_time = 0.1



func _on_Timer_timeout():
	var enemie_spawn_location = $enemiePath/spawnLocation
	enemie_spawn_location.unit_offset = randf()
	
	var enemie = enemie_scene.instance()
	add_child(enemie)
	
	enemie.position = enemie_spawn_location.position
	
	var direction = enemie_spawn_location.rotation + PI / 2
	direction += rand_range(-PI / 4 , PI / 4)
	
	
	var velocity = Vector2(rand_range(enemie.min_speed , enemie.max_speed) , 0 )
	enemie.linear_velocity = velocity.rotated(direction)


