class_name Climber
extends Node2D

@onready var area: Area2D = $Area2D

func _ready() -> void:
   area.body_entered.connect(on_body_entered)
   area.body_exited.connect(on_body_exited)


func on_body_entered(body: Node2D) -> void:
    if not body is Player:
        return

    body.is_near_ladder = true
    body.ladder_pos = get_global_transform().origin


func on_body_exited(body: Node2D) -> void:
    if not body is Player:
        return

    body.is_near_ladder = false
    body.ladder_pos = Vector2.ZERO
    body.is_climbing = false
