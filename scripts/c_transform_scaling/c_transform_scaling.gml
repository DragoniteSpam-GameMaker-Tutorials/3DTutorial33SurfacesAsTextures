/// @param x
/// @param y
/// @param z
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_transform_scaling(argument0, argument1, argument2) {
	/*
	Sets the scaling of the transformation.
	Note: Scaling only applies to shapes and will have no effect when applied to a collision object.
	Note: Not all shapes support non-uniform scaling.
	*/
	return external_call(global._c_transform_scaling, argument0, argument1, argument2);


}
