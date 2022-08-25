extends Camera2D

onready var TopLeft = $TopLeft
onready var BottomRight = $BottomRight


#set contraints.
func _ready() -> void:
	limit_top = TopLeft.position.y
	limit_left = TopLeft.position.x
	limit_bottom = BottomRight.position.y
	limit_right = BottomRight.position.x
