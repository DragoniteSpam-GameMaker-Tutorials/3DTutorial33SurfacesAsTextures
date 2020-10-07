/// @param shape
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_shape_destroy(argument0) {
	/*
	Destroys the shape, freeing the memory used. Don't destroy a shape while there are objects using it.
	*/
	return external_call(global._c_shape_destroy, argument0);


}
