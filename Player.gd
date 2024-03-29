extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum  {UP=0, DOWN=1, LEFT=2, RIGHT=3}
var seek_moving_block = 0
var moving_block

var now_moving_block 

var random_generator = RandomNumberGenerator.new()

var GAME_WINDOW_WIDTH
var GAME_WINDOW_HEIGHT

var Grid_Position = Vector2(0,0)

        
            
        
        

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
        
    moved_vector = moved_vector * self.get_parent().BLOCK_SIZE
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
    
    GAME_WINDOW_WIDTH = self.get_parent().BLOCK_SIZE * self.get_parent().GRID_SIZE_X
    GAME_WINDOW_HEIGHT = self.get_parent().BLOCK_SIZE * self.get_parent().GRID_SIZE_Y
    
    print("GAME_WINDOW_WIDTH=" + str(GAME_WINDOW_WIDTH), ",GAME_WINDOW_HEIGHT=" + str(GAME_WINDOW_HEIGHT))
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    
    if now_moving_block != null:
        if seek_moving_block < len(now_moving_block):
            print("position=" + str(position))
            var moved_vector = get_vector(now_moving_block[seek_moving_block])
            seek_moving_block += 1
            print("moved_vector=" + str(moved_vector))
            
            if self.position.x + moved_vector.x >= 0 and self.position.x + moved_vector.x < GAME_WINDOW_WIDTH: 
                Grid_Position.x += moved_vector.x/32           
                self.move_local_x(moved_vector.x)
            else:
                print("Gameの箱の左右サイドにぶつかった。" + str(self.position.x + moved_vector.x))
                
            if self.position.y + moved_vector.y >= 0 and self.position.y + moved_vector.y < GAME_WINDOW_HEIGHT: 
                Grid_Position.y += moved_vector.y/32                     
                self.move_local_y(moved_vector.y)
            else:
                print("Gameの箱の上下サイドにぶつかった。" + str(self.position.y + moved_vector.y))
            print("Grid:"+str(Grid_Position))
        else:
            seek_moving_block = 0
            now_moving_block = null
            
