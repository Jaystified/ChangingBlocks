extends Particles2D

export var TTL = 2
var timer = 0

func _ready():
    pass # Replace with function body.

func _process(delta):
    timer+=delta
    if(timer>TTL):
        queue_free()
    pass
