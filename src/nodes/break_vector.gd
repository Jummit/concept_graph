tool
extends ConceptNode


func _init() -> void:
	unique_id = "break_vector"
	display_name = "Break Vector"
	category =  "Vectors"
	description = "Exposes a Vector (x,y,z) components"

	set_input(0, "Vector", ConceptGraphDataType.VECTOR)
	set_output(0, "x", ConceptGraphDataType.SCALAR)
	set_output(1, "y", ConceptGraphDataType.SCALAR)
	set_output(2, "z", ConceptGraphDataType.SCALAR)


func _generate_output(idx: int) -> float:
	var input_vector = get_input_single(0)
	if not input_vector:
		return 0.0

	match idx:
		0:
			return input_vector.x
		1:
			return input_vector.y
		2:
			return input_vector.z

	return 0.0
