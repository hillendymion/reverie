extends KinematicBody2D
var Attack = 3
var Defense = 1
var spd = 60
var accel = 300

onready var sprite = $Sprite
onready var AnimPlyr = $AnimationPlayer
onready var hitbox = $Hitbox
onready var bossMeter = $CanvasLayer/Boss_Meter/HP_Bar

signal Enemy_Bullet_Fired(bullet, pos, direction)

func _ready() -> void:
	AnimPlyr.play("Idle_Move")


func _physics_process(delta: float) -> void:
	pass


func _on_Hurtbox_body_entered(body: Node) -> void:
	#enemy gets hit by bullet.
	#get bullet element and mod that.
	if bossMeter:
		bossMeter.value = int(float(Player_Stats.Boss_IceHP/800)*300) #ill fix the values later.


func _on_Hitbox_body_entered(body: Node) -> void:
	#player damaged by enemy.
	pass # Replace with function body.

func DemonDie():
	#created explosion.
	#Signal demon ice die.
	#If all the demons are dead win game.
	if Player_Stats.Boss_FireHP == 0 and Player_Stats.Boss_IceHP == 0:
		Player_Stats.WinGame() #this if probbly better handled as a signal.
	#I honestly don't know how to end this game.
