class_name Player
extends CharacterBody2D

var facing_right: bool = true

var is_near_ladder: bool = false
var ladder_pos: Vector2 = Vector2.ZERO
var is_climbing: bool = false

func _physics_process(delta: float) -> void:
    move_and_slide()
