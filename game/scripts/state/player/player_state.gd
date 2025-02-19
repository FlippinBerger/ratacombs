class_name PlayerState
extends State


# TODO: Put in all the things we'll need for PlayerStates here
@export var player: CharacterBody2D
const SPEED = 550.0
const JUMP_VELOCITY = -600.0

func enter() -> void:
    pass


func exit() -> void:
    pass


func update(delta: float) -> void:
    pass


func physics_update(delta: float) -> void:
    if not player.is_on_floor():
        player.velocity += player.get_gravity() * delta

