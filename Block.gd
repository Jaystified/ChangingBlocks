extends Sprite

export var KIND = 1
export var victoryblock = false
var block_tex = load("res://block.png") 
var skull_tex = load("res://dokuro.png") 

var random_generator = RandomNumberGenerator.new()
var timer = 0.0

func _ready():
    random_generator.randomize()
    var R=KIND%2
    var G=KIND%3
    var B=KIND%5
    modulate = Color(R,G,B)
    
func _process(delta):
    if victoryblock:
        timer = timer+delta
        if timer>0.2:
            timer = 0
            modulate = Color(c(),c(),c())
    if get_parent().Failure_Kind == KIND:
        texture = skull_tex
    else:
        texture = block_tex
    pass
    
func c():
    var c = random_generator.randf()
#    if c < 0.5:
#        c = c + 0.5
    return c