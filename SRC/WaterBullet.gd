extends KinematicBody2D
#get direction of player.
#fire bullet in that direction.
export var element = "Water" #Water, Fire, Wind, None
export var damMod = 1 #damage added to the base attack damage. though maybe it works better in stats.
export var spd = 200
var vel = Vector2(0,0) #direction.
var direction = Vector2.ZERO #trying different things here.
#var adir = "Squirt_D"

var Impact = preload("res://Objects/Bullets/Effect_Splish.tscn")
onready var hitbox = $Area2D/hitbox
onready var asprite = $AnimatedSprite
#export var boom = preload("res://Object/Effect.tscn") #TBD


func _ready() -> void:
	#play aimation based on vel direction. maybe use an array?
	asprite.play("default")


func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(vel.normalized() * delta * spd)
	
func _on_AnimatedSprite_animation_finished() -> void:
	print("splish")
	queue_free()
	
func _on_Hitbox_area_entered(area: Area2D) -> void:
	#hits something
	print("hit something")
	var impact = Impact.instance()
	impact.position = self.global_position
	self.queue_free()

func set_dir(direction):
	#connected and passed through the bullet manager
	self.direction = direction
	rotation += direction.angle()
	#rotation_degrees?



