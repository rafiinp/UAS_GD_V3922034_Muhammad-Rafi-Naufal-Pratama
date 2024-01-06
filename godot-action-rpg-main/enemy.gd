extends CharacterBody2D

@export var MAX_SPEED = 150
@export var target: Node2D
@export var points_on_death: int = 10  # Jumlah poin yang diterima saat musuh mati

@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D

signal enemy_died(points)

func _physics_process(delta):
	var direction = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = direction * MAX_SPEED
	move_and_slide()

func create_path():
	navigation_agent.target_position = target.global_position

func _on_timer_timeout():
	create_path()

func _on_hurtbox_area_entered(area):
	# Tambahkan logika lain seperti efek mati atau suara
	queue_free()
	emit_signal("enemy_died", points_on_death)
