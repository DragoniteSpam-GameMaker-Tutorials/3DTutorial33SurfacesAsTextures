/// @param shape
/// @param radius
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_shape_add_sphere(argument0, argument1) {
	/*
	Adds a sphere to a shape, centered at (0,0,0)
	This shape is very efficient, but it can't have a non-uniform scale.
	Note: The shape will be added with the currently defined transformation.
	*/
	return external_call(global._c_shape_add_sphere, argument0, argument1);


}
