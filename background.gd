extends ParallaxBackground

export (float) var speed = 300.0

func _process(delta):
	scroll_offset.y += speed * delta
