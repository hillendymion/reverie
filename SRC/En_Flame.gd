extends KinematicBody2D

onready var Anim_Sprite = $AnimatedSprite
export var Enemy_HP = 4
export var Attack = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_Hitbox_body_entered(body: Node) -> void:
	#Enemy bonks player
	var damage = Attack - Player_Stats.Defense 
	#apply element modifiers too once implemented
	if damage < 1: damage == 1
	
	Player_Stats.HP -= damage #turn on Iframes? I may have to do that through the player character.


func _on_Hurtbox_body_entered(body: Node) -> void:
	#Enemy take damage
	Enemy_HP -= Player_Stats.Attack
	#Modifiers TBImplemented
	if Enemy_HP <= 0:
		Enemy_Die()
	
func Enemy_Die():
	#create death explosion
	#possibly drop item
	queue_free()
