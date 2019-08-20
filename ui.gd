extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum  {UP=0, DOWN=1, LEFT=2, RIGHT=3}
var block_size = 32


func get_vector_form_array(arrow):
    if arrow == UP:
        return Vector2(0, -1)
    elif arrow == DOWN:
         return Vector2(0, 1)
    elif arrow == LEFT:
         return Vector2(-1, 0)
    elif arrow == RIGHT:
         return Vector2(1, 0)
        
    return Vector2(0,0)


func asign_array_block(first_arrow, moving_block):
    var block_vector = get_vector_form_array(first_arrow)
    var current_position = block_vector * block_size * 2
    
    for arrow in moving_block:
        var arrow_block_scene = load("res://array-block.tscn")
        var scene_instance = arrow_block_scene.instance()
#        arrow_block_scene.set_name("test")
        scene_instance.position = current_position
        add_child(scene_instance)
        
        current_position += block_vector * block_size


# Called when the node enters the scene tree for the first time.
func _ready():
    pass
    
func update_ui(moving_blocks):    
    print(moving_blocks)
    for first_array in moving_blocks:
        
        asign_array_block(first_array, moving_blocks[first_array])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
