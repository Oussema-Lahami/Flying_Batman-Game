extends Node


export (PackedScene) var enemie_scene
export (PackedScene) var devilFruit_scene
var score = 0 
export var startOver = false


func _ready():
	pass

func new_game():
	$GameOver.stop()
	score = 0
	$HUD.update_score(score)
	
	get_tree().call_group("enemies" , "queue_free")
	$player.start($StartPos.position)
	$music.play()
	$HUD.show_message("Get ready ...")
	$ScoreTimer.start()
	$enemiesTimer.start()
	$spawn1.start()
	$spaqn2.start()
	$spawn3.start()
	$MessageLabel.hide()
	
func game_over():
	$ScoreTimer.stop()
	$enemiesTimer.stop()
	$HUD.show_game_over()
	$music.stop()
	$GameOver.play()
	startOver = true
	$enemiesTimer.wait_time = 1.5







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



func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	




func _on_spawn1_timeout():
	$enemiesTimer.wait_time = 0.7


func _on_spaqn2_timeout():
	$enemiesTimer.wait_time = 0.6


func _on_spawn3_timeout():
	$enemiesTimer.wait_time = 0.5
