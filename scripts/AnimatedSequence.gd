extends AnimatedSprite

# Types of animations
export var DEFAULT = "default"
export var HURTING = "hurting"
export var ATTACKING = "attacking"
export var RUNNING = "running"
export var WALKING = "walking"

const ANIMATION_FINISHED_CODE = "animation_finished"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect(ANIMATION_FINISHED_CODE, self, "_onAnimatedSprite_animation_finished")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _onAnimatedSprite_animation_finished():
	#self._play_random_animation()
	
	self.animation = DEFAULT
	self._print_current_animation()

func _play_animation(animation_name):
	self.animation = animation_name

func _play_random_animation():
	match randi()% 4 + 1:
		1:
			self.animation = HURTING
		2:
			self.animation = ATTACKING
		3:
			self.animation = RUNNING
		4:
			self.animation = WALKING
		_:
			self.animation = DEFAULT

func _print_current_animation():
	print("Playing " + self.animation + " animation.")