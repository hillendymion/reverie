extends Node

export var Enemy_maxHP = 4
var Enemy_HP
export var Attack = 1
export var Element = "Fire"
export var Def = 0
export var speed = 80

func _ready() -> void:
	Enemy_HP = Enemy_maxHP
