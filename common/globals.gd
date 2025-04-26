extends Node

static var revive_active := false
static var score: int = 0

static func reset() -> void:
	revive_active = false
	score = 0
