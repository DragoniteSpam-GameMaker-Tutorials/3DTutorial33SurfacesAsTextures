/// @param object
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_world_destroy_object(argument0) {
	/*
	Removes the object from the world and then destroys it, freeing the memory used.
	A convenience script. Same thing as removing the object and then destroying it yourself.
	*/
	c_world_remove_object(argument0);
	c_object_destroy(argument0);


}
