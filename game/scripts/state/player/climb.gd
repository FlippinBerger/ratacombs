class_name PlayerClimbState
extends PlayerState


func enter() -> void:
    player.is_climbing = true
    player.position.x = player.ladder_pos.x
    player.velocity = Vector2.ZERO
    # TODO: Maybe smooth this out, but for now just snap
    # var new_pos = Vector2(player.ladder_pos.x, player.position.y)
    # player.position = player.position.lerp(new_pos, 1)


func exit() -> void:
    player.is_climbing = false
    player.velocity = Vector2.ZERO


func input(event: InputEvent) -> void:
    if event.is_action_pressed("move_right") or event.is_action_pressed("move_left"):
        transitioned.emit(self, "playeridle")


func update(delta: float) -> void:
    if !player.is_climbing:
        transitioned.emit(self, "playeridle")


func physics_update(delta: float) -> void:
    if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
        var direction := Input.get_axis("up", "down")
        if direction:
            player.velocity.y = direction * SPEED
        else:
            player.velocity.y = move_toward(player.velocity.y, 0, SPEED)
    else:
        player.velocity.y = 0

