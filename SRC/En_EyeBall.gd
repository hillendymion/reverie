extends KinematicBody2D

onready var eneStats = $eneStats
onready var Anim_Sprite = $AnimatedSprite
const eneDie = preload("res://Objects/Bullets/EnemyDead.tscn")

enum {
	IDLE,
	CHASE,
	WANDER
}

func _ready() -> void:
	Anim_Sprite.play("front")
	
func _physics_process(delta: float) -> void:
	#use the enums here.
	pass



func _on_Hurtbox_area_entered(area: Area2D) -> void:
	#enemy gets bonked by player bullets
	var damage = Player_Stats.Attack+Player_Stats.Attackmod - eneStats.Def
	#this stat will be replaced with th damage stored from the bullet itself.
	if damage <= 0: damage = 0
	eneStats.Enemy_HP - damage
	print(str(eneStats.Enemy_HP)+"/"+str(eneStats.Enemy_maxHP))
	if eneStats.Enemy_HP <= 0:
		Enemy_Die()
	
func Enemy_Die():
	#i should make a signal for this from the stats like the example.
	var enedie = eneDie.instance()
	get_parent().add_child(enedie)
	enedie.position = self.global_position
	#possibly drop item
	queue_free()
