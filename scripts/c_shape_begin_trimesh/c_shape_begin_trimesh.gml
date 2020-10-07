/// @author https://web.archive.org/web/20191214124933/https://gmc.yoyogames.com/index.php?showtopic=632606
function c_shape_begin_trimesh() {
	/*
	Creates a trimesh that you can add triangles to. Call this before adding any triangles.
	Note: Trimeshes cannot collide with other trimeshes. Intended use is static level geometry.
	*/
	return external_call(global._c_shape_begin_trimesh);


}
