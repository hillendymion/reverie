extends KinematicBody2D

var direction = 0
var vel = Vector2.ZERO

var facing = 0 
onready var Anim_Plyr = $AnimationPlayer
onready var eneStats = $eneStats #MaxHP will likely be unused. Interations bust change.
onready var hitbox = $Hitbox
onready var timer = $Timer
onready var bossMeter = $CanvasLayer/Boss_Meter/HP_Bar
#preload enemy bullets
#preload Boss hud
signal Demon_Bullet_Fired(bullet, pos, direction)

enum {
	WARP,
	CHASE,
	SPELL
}


func _ready() -> void:
	#self.connect(Demon_Bullet_Fired, self, )
	eneStats.Enemy_maxHP = Player_Stats.Boss_IceHP
	if Player_Stats.Boss_IceHP <= 0: queue_free()
	Anim_Plyr.play("Idle")

func _physics_process(_delta: float) -> void:
	#Make enums for attacks. Wander, charger, whip attack, Chargespell
	
	
	pass
	
	


func _on_Hitbox_body_entered(body: Node) -> void:
	#this thing hurts player when collided
	print("ow -",eneStats.Attack, " damage" )
	


func _on_Timer_timeout() -> void:
	#change tactic. changes enum
	pass # Replace with function body.


func _on_Hurtbox_area_entered(area: Area2D) -> void:
	#Bulllet hit this guy
	Player_Stats.Boss_IceHP -= Player_Stats.Attack+Player_Stats.Attackmod #replace with damage amount.
	#get bullet element and mod that.
	Player_Stats.newsong("res://Audio/Song/dark space.ogg")
	if bossMeter:
		bossMeter.value = int(float(Player_Stats.Boss_IceHP/800)*300) #ill fix the values later.
	
func Demon_Shoot():
	var bullet = null #for now
	var pos = null
	
	emit_signal("Demon_Bullet_Fired",bullet, pos, vel )

func DemonDie():
	#Signal demon ice die.
	#If all the demons are dead win game.
	if Player_Stats.Boss_FireHP == 0 and Player_Stats.Boss_IceHP == 0:
		Player_Stats.WinGame() #this if probbly better handled as a signal.
	#I honestly don't know how to end this game.

