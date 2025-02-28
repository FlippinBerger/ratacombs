class_name PlayerRunState
extends PlayerState

func enter() -> void:
    pass


func exit() -> void:
    pass


func update(delta: float) -> void:
    pass

func _input(event: InputEvent) -> void:
    super(event)

    if event.is_action_pressed("jump"):
        player.velocity.y = JUMP_VELOCITY
        transitioned.emit(self, "playerjump")
        return

    if event.is_action_pressed("down"):
        transitioned.emit(self, "playercrouch")
        return


func physics_update(delta: float) -> void:
    super(delta)

    if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
        var direction := Input.get_axis("move_left", "move_right")
        if direction:
            player.velocity.x = direction * SPEED
        else:
            player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
    else:
        player.velocity.x = 0
        transitioned.emit(self, "playeridle")
