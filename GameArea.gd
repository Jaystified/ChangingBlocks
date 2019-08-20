extends Node2D

var BLOCK_SIZE = 32
export var GRID_SIZE_X = 3
export var GRID_SIZE_Y = 3

# Called when the node enters the scene tree for the first time.
func _ready():
    var i = 0
    var j = 0
    while (i < GRID_SIZE_Y):
        while (j < GRID_SIZE_X):
            var scene = load("res://Block.tscn")
            var scene_instance = scene.instance()
            scene_instance.set_name("Block_"+str(i)+"_"+str(j))
            scene_instance.position = Vector2(j*BLOCK_SIZE+BLOCK_SIZE/2,i*BLOCK_SIZE+BLOCK_SIZE/2)
            scene_instance.KIND = i+j+1
            add_child(scene_instance)            
            print(scene_instance)
            j=1+j
        j=0
        i=1+i
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
