extends Area2D

func _ready():
	connect("area_entered", Callable(self, "_on_entered"))
	
func _on_area_entered(area):
	if area.name == "hurtbox":
		if area.get_parent().has_method("take_damage"):
			area.get_parent().take_damage(10)
			
