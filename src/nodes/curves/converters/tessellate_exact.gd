tool
extends ConceptNode

"""
Tessellate a curve using the path controls points only.
This does not preserve the in / out positions of each controls.
"""


func _init() -> void:
	unique_id = "curve_tesselate_exact"
	display_name = "Tesselate curve (Exact)"
	category = "Curves/Conversion"
	description = "Creates a polygon curve from the curve control points only"

	set_input(0, "Curve", ConceptGraphDataType.CURVE)
	set_output(0, "", ConceptGraphDataType.VECTOR_CURVE)


func _generate_output(idx: int) -> Array:
	var res = []
	var curves = get_input(0)
	if not curves:
		return res

	if not curves is Array:
		curves = [curves]
	elif curves.size() == 0:
		return res

	for c in curves:	# c is a Path object here
		var p = ConceptNodeVectorCurve.new()
		var points = PoolVector3Array()
		var curve: Curve3D = c.curve

		for i in range(curve.get_point_count()):
			points.append(curve.get_point_position(i))

		p.points = points
		p.transform = c.transform
		res.append(p)

	return res

