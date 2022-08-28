extends Node2D

onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	$AnimationPlayer.play("load")

	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_shoot") or Input.is_action_just_pressed("ui_select"):
		print("confirmed")
		get_tree().change_scene("res://Objects/Rooms/LVL_Intro_Cutscene.tscn")
		#go to next scene.


func _on_Timer_timeout() -> void:
	if $Label2.visible: $Label2.visible = false
	else: $Label2.visible = true
