/// @param object
/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_object_get_userid(argument0) {
	/*
	Use this to retrieve the value that you set with c_object_set_userid().
	Returns 0 if no value has been set.
	*/
	return external_call(global._c_object_get_userid, argument0);


}
