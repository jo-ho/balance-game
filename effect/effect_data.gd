class_name EffectData
extends Resource

enum Type {
	FREEZE,
	ENLARGE,
	SHRINK,
	TO_SQUARE,
	STICKY,
	FOG,	
}

@export var type: Type
@export var name: String
@export var scene: PackedScene
@export var sprite: Texture2D
