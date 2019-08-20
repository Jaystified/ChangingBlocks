extends Sprite

export var KIND = 1
export var victoryblock = false
var block_tex = load("res://block.png") 
var skull_tex = load("res://dokuro.png") 

var random_generator = RandomNumberGenerator.new()
var timer = 0.0

func _ready():
    random_generator.randomize()
    
func _process(delta):
    if victoryblock:
        timer = timer+delta
        if timer>0.2:
            timer = 0
            modulate = Color(c(),c(),c())
    else:
        var R=1.0/(KIND%2+1)
        var G=1.0/(KIND%3+1)
        var B=1.0/(KIND%5+1)
        if(KIND==1):
            R=0.8
            G=0.2
            B=0.2
        elif(KIND==2):
            R=0.2
            G=0.8
            B=0.2
        elif(KIND==3):
            R=0.2
            G=0.2
            B=0.8
        elif(KIND==4):
            R=0.8
            G=0.2
            B=0.8 
        modulate = Color(R,G,B)
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