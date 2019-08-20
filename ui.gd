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
        

func get_arrow_texture(arrow):
    if arrow == UP:
        return load("res://up-arrow.png") 
    elif arrow == DOWN:
         return load("res://down-arrow.png") 
    elif arrow == LEFT:
         return load("res://left-arrow.png") 
    elif arrow == RIGHT:
         return load("res://right-arrow.png") 


func asign_array_block(first_arrow, arrow_tex, moving_block):
    var block_vector = get_vector_form_array(first_arrow)
    var current_position = block_vector * block_size * 2
    
    
    for arrow in moving_block:
        var arrow_block_scene = load("res://array-block.tscn")
        var scene_instance = arrow_block_scene.instance()
        scene_instance.position = current_position
        add_child(scene_instance)

        var arrow_block_scene2 = load("res://array-block.tscn")
        var scene_instance2 = arrow_block_scene.instance()
        scene_instance2.position = current_position
        scene_instance2.texture = arrow_tex
        scene_instance2.z_index = 1
        add_child(scene_instance2)
        
        current_position += block_vector * block_size


# Called when the node enters the scene tree for the first time.
func _ready():
    pass
    
func update_ui(moving_blocks):    

    print(moving_blocks)
    for first_arrow in moving_blocks:
        var arrow_texture = get_arrow_texture(first_arrow)
        asign_array_block(first_arrow, arrow_texture, moving_blocks[first_arrow])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
