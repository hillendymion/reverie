extends KinematicBody2D

onready var Anim_Sprite = $AnimatedSprite
onready var eneStats = $eneStats
const eneDie = preload("res://Objects/Bullets/EnemyDead.tscn") #maybe this one can be passed from the stats.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Flame HP:"+str(eneStats.Enemy_HP)+"/"+str(eneStats.Enemy_maxHP))
	pass # Replace with function body.



func _on_Hitbox_body_entered(body: Node) -> void:
	#Enemy bonks player
	var damage = eneStats.Attack - Player_Stats.Defense 
	#apply element modifiers too once implemented
	if damage < 1: damage == 1
	
	Player_Stats.HP -= damage #turn on Iframes? I may have to do that through the player character.


func _on_Hurtbox_body_entered(body: Node) -> void:
	#Enemy take damage
	#enemy gets bonked by player bullets
	var damage = Player_Stats.Attack+Player_Stats.Attackmod - eneStats.Def
	#this stat will be replaced with th damage stored from the bullet itself.
	if damage <= 0: damage = 0
	eneStats.Enemy_HP - damage
	print(str(eneStats.Enemy_HP)+"/"+str(eneStats.Enemy_maxHP))
	if eneStats.Enemy_HP <= 0:
		Enemy_Die()
	
func Enemy_Die():
	var enedie = eneDie.instance()
	get_parent().add_child(enedie)
	enedie.position = self.global_position
	#possibly drop item
	queue_free()
