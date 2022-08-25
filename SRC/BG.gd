extends Sprite

export var bgvelocity: float = -1.2
export var newx: float = 2.0

var g_texture_width: float = 0

func _ready():
	g_texture_width  = texture.get_size().x *scale.x
	
func _process(delta: float) -> void:
	position.x += bgvelocity
	_attempt_reposition()
	
func _attempt_reposition():
	if position.x < -g_texture_width:
		#don't just reset the texture position, less theres a gap.
		position.x += (newx * g_texture_width)-2
	
