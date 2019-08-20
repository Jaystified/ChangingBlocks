extends Node2D

var BLOCK_SIZE = 32
export var BLOCK_VARIERTY = 4
export var GRID_SIZE_X = 16
export var GRID_SIZE_Y = 16

var Victory_Kind = 0
var Failure_Kind = 0
var Grid = []

func _ready():
    var i = 0
    var j = 0
    Grid.resize(j)
    while (i < GRID_SIZE_Y):
        while (j < GRID_SIZE_X):
            var scene = load("res://Block.tscn")
            var scene_instance = scene.instance()
            scene_instance.set_name("Block_"+str(i)+"_"+str(j))
            scene_instance.position = Vector2(j*BLOCK_SIZE,i*BLOCK_SIZE)
            scene_instance.KIND = i+j+1 # Randomize! (later)
            add_child(scene_instance)
            j=1+j
        j=0
        i=1+i
    pass 

#func _process(delta):
#    pass
