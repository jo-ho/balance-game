extends Node2D

# Preload your platform scene
const Platform = preload("res://scenes/platform.tscn")

func _ready():
	generate_level(1000)  # Generate 1000 units tall level

func generate_level(height):
	# Clear existing platforms first (if any)
	for child in $Platforms.get_children():
		child.queue_free()
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var current_height = 0
	
	while current_height < height:
		var platform = Platform.instance()
		var length = rng.randi_range(50, 200)
		var position_x = rng.randi_range(50, 750)
		
		# Set platform properties
		platform.position = Vector2(position_x, -current_height)
		platform.length = length
		
		$Platforms.add_child(platform)
		current_height += rng.randi_range(50, 150)
