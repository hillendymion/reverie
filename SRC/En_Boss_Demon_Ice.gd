extends KinematicBody2D

var direction = 0
var vel = Vector2.ZERO
var speed = 80
var attack = 2
var facing = 0 
onready var Anim_Plyr = $AnimationPlayer
onready var hitbox = $Hitbox
onready var timer = $Timer
#preload enemy bullets
#preload Boss hud

func _ready() -> void:
	if Player_Stats.Boss_IceHP >= 0: queue_free()
	Anim_Plyr.play("Idle")

func _physics_process(_delta: float) -> void:
	#Make enums for attacks. Wander, charger, whip attack, Chargespell
	
	pass
	


func _on_Hitbox_body_entered(body: Node) -> void:
	#this thing hurts player when collided
	print("ow -",attack, " damage" )
	


func _on_Timer_timeout() -> void:
	#change tactic. changes enum
	pass # Replace with function body.


func _on_Hurtbox_area_entered(area: Area2D) -> void:
	#Bulllet hit this guy
	pass # Replace with function body.
