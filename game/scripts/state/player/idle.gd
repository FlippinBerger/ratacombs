class_name PlayerIdleState
extends PlayerState

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("jump") and player.is_on_floor():
        player.velocity.y = JUMP_VELOCITY
        transitioned.emit(self, "playerjump")
        return

    if event.is_action_pressed("move_right") or event.is_action_pressed("move_left"):
        var direction := Input.get_axis("move_left", "move_right")
        if direction:
            player.velocity.x = direction * SPEED
        else:
            player.velocity.x = move_toward(player.velocity.x, 0, SPEED)

        transitioned.emit(self, "playerrun")
        return

# func enter() -> void:
#     # play idle animation
#
#
# func exit() -> void:
#     # stop idle animation?
#     # TODO: Find out if we need to stop animations or if we can just overwrite
#     # the player
#     pass
#
#
# func update(delta: float) -> void:
#     pass

# can't override this if we want what's playing in the parent but can call super
# func physics_update(delta: float) -> void:
#     super(delta)
