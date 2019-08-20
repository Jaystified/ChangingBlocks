extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum  {UP=0, DOWN=1, LEFT=2, RIGHT=3}
var seek_moving_block = 0
var moving_block

export var MAX_BLOCK_SIZE=3
var now_moving_block 

var random_generator = RandomNumberGenerator.new()

func inverse_arrow(arrow):
    if arrow == UP:
        return DOWN

    elif arrow == DOWN:
        return UP

    elif arrow == LEFT:
        return RIGHT

    elif arrow == RIGHT:
        return LEFT
        
            

func random_moving_block(first_arrow, max_block_size):    
    var block = [first_arrow]
    var before_arrow = first_arrow
    for i in range(max_block_size-1):
        if random_generator.randi_range(0, 1) == 1:
            # 次に進む
            while true:
                var arrow = random_generator.randi_range(0, 3)
                if arrow != inverse_arrow(before_arrow):
                    block.append(arrow)
                    break
                    
        else:
            break
    
    return block
        
        

#var moved_vector
func _input(event):
#    moved_vector = Vector2()
    if event.is_action_pressed("Up"):
        print("Up!")
        now_moving_block = moving_block[UP]
#        moved_vector = Vector2(0,-1)

    elif event.is_action_pressed("Down"):
#        moved_vector = Vector2(0,1)
        now_moving_block = moving_block[DOWN]
        print("Down!")

    elif event.is_action_pressed("Left"):
#        moved_vector = Vector2(-1,0)
        now_moving_block = moving_block[LEFT]
        print("Left!")

    elif event.is_action_pressed("Right"):
#        moved_vector = Vector2(1,0)
        now_moving_block = moving_block[RIGHT]
        print("Right!")


func get_vector(arrow):
    var moved_vector = Vector2(0,0)
    if arrow == UP:
        moved_vector = Vector2(0,-1)

    elif arrow == DOWN:
        moved_vector = Vector2(0,1)

    elif arrow == LEFT:
        moved_vector = Vector2(-1,0)

    elif arrow == RIGHT:
        moved_vector = Vector2(1,0)
        
    moved_vector = moved_vector * 32
    return moved_vector
    
    

# Called when the node enters the scene tree for the first time.
func _ready():
#var moving_block = {
#    UP: [UP,UP,UP],
#    DOWN: [DOWN,RIGHT],
#    LEFT: [LEFT,LEFT,UP],
#    RIGHT: [RIGHT]
#    } 
    random_generator.randomize()
    moving_block = {}
    for first_arrow in [UP, DOWN, LEFT, RIGHT]:
        moving_block[first_arrow] = random_moving_block(first_arrow, MAX_BLOCK_SIZE)
    
    print("moving_block=" + str(moving_block))
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    
    if now_moving_block != null:
        if seek_moving_block < len(now_moving_block):
            print("position=" + str(position))
            var moved_vector = get_vector(now_moving_block[seek_moving_block])
            seek_moving_block += 1
            print("moved_vector=" + str(moved_vector))
            
            self.move_local_x(moved_vector.x)
            self.move_local_y(moved_vector.y)
        
        else:
            seek_moving_block = 0
            now_moving_block = null
            
