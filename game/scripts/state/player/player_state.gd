class_name PlayerState
extends State


# TODO: Put in all the things we'll need for PlayerStates here
@export var player: Player
const SPEED = 350.0
const JUMP_VELOCITY = -400.0

func enter() -> void:
    pass


func exit() -> void:
    pass


func update(delta: float) -> void:
    pass

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("move_left") and player.facing_right:
        print("going left")
        player.facing_right = false

    elif event.is_action_pressed("move_right") and !player.facing_right:
        print("going right")
        player.facing_right = true


func physics_update(delta: float) -> void:
    if not player.is_on_floor():
        player.velocity += player.get_gravity() * delta
