extends Node2D
#Enter1, Enter2
onready var stats = Player_Stats

func _ready() -> void:
	print(stats.Door_Name)
	if stats.Door_Name:
		var enter_node = find_node(stats.Door_Name)
		if enter_node:
			$Plyr.global_position = enter_node.global_position
			#trying this with position2d
