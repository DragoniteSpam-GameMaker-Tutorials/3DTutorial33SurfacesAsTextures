/// @param n
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_hit_object(argument0) {
	/*
	Returns the id's of the collision objects that were hit.
	For raycasts and sweeps, only one object can be hit so use 0 as the argument.
	Overlap tests can hit multiple objects to use argument0 to access each one.
	c_overlap_world() and c_overlap_world_position() return the number of objects that were hit.
	*/
	return external_call(global._c_hit_object, argument0);


}
