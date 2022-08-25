extends KinematicBody2D
var Attack = 3
var Defense = 1
var spd = 60
var accel = 300

onready var sprite = $Sprite
onready var AnimPlyr = $AnimationPlayer
onready var hitbox = $Hitbox


func _ready() -> void:
	AnimPlyr.play("Idle_Move")


func _physics_process(delta: float) -> void:
	pass


func _on_Hurtbox_body_entered(body: Node) -> void:
	#enemy gets hit by bullet.
	pass # Replace with function body.


func _on_Hitbox_body_entered(body: Node) -> void:
	#player damaged by enemy.
	pass # Replace with function body.
