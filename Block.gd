extends Sprite

export var KIND = 1

# Called when the node enters the scene tree for the first time.
func _ready():
    KIND=KIND+1
    var R=KIND%2
    var G=KIND%3
    var B=KIND%5
    modulate = Color(R,G,B)
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
