extends Control

onready var showStats = $ShowStats
onready var Arrow = $SelectArrow
var arrowspace = 20

func _ready() -> void:
	#set process function to false(pauses game.)
	get_tree().paused = true #pause variable.

func _physics_process(delta: float) -> void:
	
	DisplayStats()
	
	if Input.is_action_just_released("ui_exit_menu"):
		#just testing for now.
		#Might use this to fire a shot.
		get_tree().paused = false
		exit_menu()
	
	#obviously will confine itself to the options when implemented.
	if Input.is_action_just_released("ui_down"):
		Arrow.position.y += arrowspace
	if Input.is_action_just_released("ui_up"):
		Arrow.position.y -= arrowspace
	if Input.is_action_just_released("ui_left"):
		Arrow.position.x -= arrowspace
	if Input.is_action_just_released("ui_right"):
		Arrow.position.x += arrowspace
	
func exit_menu():
	#set cuntion process to true.
	queue_free()

func DisplayStats():
	#var stats = "", stats.hp
	
	showStats.text = "P"
