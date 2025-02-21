class_name Player
extends CharacterBody2D

var facing_right: bool = true

func _physics_process(delta: float) -> void:
    move_and_slide()
