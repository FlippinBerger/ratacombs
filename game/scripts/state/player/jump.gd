class_name PlayerJumpState
extends PlayerState

var has_doubled = false

func enter() -> void:
    has_doubled = false
    pass


func input(event: InputEvent) -> void:
    super(event)

    if event.is_action_pressed("jump") and !has_doubled:
        has_doubled = true
        player.velocity.y = JUMP_VELOCITY


func exit() -> void:
    pass


func update(delta: float) -> void:
    pass


func physics_update(delta: float) -> void:
    super(delta)

    var player_moving = Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")
    
    # TODO: change this to check for when we start falling instead to change to 
    # the fall state first
    if player.is_on_floor():

        if player_moving:
            transitioned.emit(self, "playerrun")
            return
        if Input.is_action_pressed("down"):
            transitioned.emit(self, "playercrouch")
            return

        player.velocity = Vector2.ZERO
        transitioned.emit(self, "playeridle")
        return

    # Deal with air drifting
    if player_moving:
        var direction := Input.get_axis("move_left", "move_right")
        if direction:
            player.velocity.x = direction * SPEED
        else:
            player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
    else:
        player.velocity.x = 0
    
        
