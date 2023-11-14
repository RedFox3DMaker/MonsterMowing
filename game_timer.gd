extends Timer

signal change_scale

@export var notify_interval: int = 5
var cumulated_elapsed_time: float = 0
var current_value: float = self.wait_time
@onready var timer_value: Label = get_node("/root/world/ux/timer_value")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cumulated_elapsed_time += delta
	current_value -= delta
	if current_value < 1:
		current_value = 0
	
	timer_value.text = str(round(current_value))
	
	if cumulated_elapsed_time >= notify_interval:
		emit_signal("change_scale")
		cumulated_elapsed_time = 0
