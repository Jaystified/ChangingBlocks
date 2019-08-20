extends Node2D

var BLOCK_SIZE = 32
export var BLOCK_VARIERTY = 4
export var GRID_SIZE_X = 16
export var GRID_SIZE_Y = 16

var Victory_Block = Vector2(0,0)
var Failure_Kind = 0
var Grid = [[]]
var Points = -1

var random_generator = RandomNumberGenerator.new()
var block = load("res://Block.tscn")

func _ready():
    $ui.position = Vector2(1200,200)
    
    var i = 0
    var j = 0
    random_generator.randomize()
    Grid.resize(GRID_SIZE_X)
    while (j < GRID_SIZE_X):
        Grid[j] = []
        Grid[j].resize(GRID_SIZE_Y)
        j+=1
    j = 0
    while (i < GRID_SIZE_Y):
        while (j < GRID_SIZE_X):
            var block_instance = block.instance()
            block_instance.set_name("Block_"+str(i)+"_"+str(j))
            block_instance.position = Vector2(j*BLOCK_SIZE,i*BLOCK_SIZE)
            block_instance.KIND = 1+random_generator.randi()%BLOCK_VARIERTY #i+j+1 # Randomize! (later)
            add_child(block_instance)
            Grid[i][j]=block_instance
            j=1+j
        j=0
        i=1+i
    get_point()
    pass

#func _process(delta):
#    pass

func get_point():
    Points += 1
    Failure_Kind = 1+random_generator.randi()%BLOCK_VARIERTY
    var i = random_generator.randi()%GRID_SIZE_Y
    var j = random_generator.randi()%GRID_SIZE_Y
    Victory_Block = Vector2(i,j)
    Grid[i][j].victoryblock = true
    