class_name PlayerCrouchState
extends PlayerState

# func enter() -> void:
#     pass

@export var animation_player: AnimationPlayer

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("jump"):
        player.velocity.y = JUMP_VELOCITY
        transitioned.emit(self, "playerjump")


func enter() -> void:
    animation_player.play("crouch")


# func exit() -> void:
#     pass


func update(delta: float) -> void:
    pass


func physics_update(delta: float) -> void:
    super(delta)

    # snag this to tell if the player has horizontal movement
    var player_moving = Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")

    if player_moving:
        var direction := Input.get_axis("move_left", "move_right")
        if direction:
            player.velocity.x = direction * SPEED
        else:
            player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
    else:
        player.velocity.x = 0

    # crouch exit states
    if !Input.is_action_pressed("crouch"):
        if player_moving:
            transitioned.emit(self, "playerrun")
            return
        transitioned.emit(self, "playeridle")
        return
    
