/// @param object
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_object_destroy(argument0) {
	/*
	Destroys the collision object, freeing the memory used.
	Do not destroy an object while it is in the world. Remove it first or use c_world_destroy_object() instead.
	*/
	return external_call(global._c_object_destroy, argument0);


}
