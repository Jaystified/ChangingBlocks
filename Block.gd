extends Sprite

export var KIND = 1

func _ready():
    var R=KIND%2
    var G=KIND%3
    var B=KIND%5
    modulate = Color(R,G,B)