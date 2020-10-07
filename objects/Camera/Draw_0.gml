/// @description Draw the 3D world
draw_clear(c_black);

shader_set(shd_basic_3d_stuff);
var uniform_light_pos = shader_get_uniform(shd_basic_3d_stuff, "lightPosition");
var uniform_light_color = shader_get_uniform(shd_basic_3d_stuff, "lightColor");
var uniform_light_range = shader_get_uniform(shd_basic_3d_stuff, "lightRange");
var uniform_light_dir = shader_get_uniform(shd_basic_3d_stuff, "lightDirection");
var uniform_light_cutoff = shader_get_uniform(shd_basic_3d_stuff, "lightCutoffAngle");
shader_set_uniform_f(uniform_light_pos, 250, 250, 64);
shader_set_uniform_f(uniform_light_color, 1, 1, 1, 1);
shader_set_uniform_f(uniform_light_range, 500);
shader_set_uniform_f(uniform_light_dir, -1, -1, -1);
shader_set_uniform_f(uniform_light_cutoff, dcos(45));

// 3D projections require a view and projection matrix
var camera = camera_get_active();
var camera_distance = 160;

var xto = Player.x;
var yto = Player.y;
var zto = Player.z + 64;
var xfrom = xto + camera_distance * dcos(Player.look_dir) * dcos(Player.look_pitch);
var yfrom = yto - camera_distance * dsin(Player.look_dir) * dcos(Player.look_pitch);
var zfrom = zto - camera_distance * dsin(Player.look_pitch);

view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

// Everything must be drawn after the 3D projection has been set
vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(spr_grass, 0));

// Draw the player
matrix_set(matrix_world, matrix_build(Player.x, Player.y, Player.z, 0, 0, 0, 1, 1, 1));
vertex_submit(vb_player, pr_trianglelist, -1);
// Draw the shadow (add a small value to the height to prevent it from fighting with the floor)
matrix_set(matrix_world, matrix_build(Player.x, Player.y, Player.z + 1, 0, 0, 0, 1, 1, 1));
vertex_submit(vb_shadow, pr_trianglelist, sprite_get_texture(spr_shadow, 0));
// Reset the transform
matrix_set(matrix_world, matrix_build_identity());

// The other things
matrix_set(matrix_world, matrix_build(400, 200, 0, 0, 0, 0, 1, 1, 1));
vertex_submit(vb_cube, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());

matrix_set(matrix_world, matrix_build(300, 300, 0, 0, 0, 0, 1, 1, 1));
vertex_submit(vb_cube, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());

matrix_set(matrix_world, matrix_build(600, 200, 0, 0, 0, 0, 1, 1, 1));
vertex_submit(vb_octagon, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());

matrix_set(matrix_world, matrix_build(200, 200, 0, 0, 0, 0, 2, 2, 2));
vertex_submit(vb_sphere, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());

matrix_set(matrix_world, matrix_build(200, 600, 0, 0, 0, 0, 2, 2, 2));
vertex_submit(vb_one_way_wall, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());

with (Ball) {
    event_perform(ev_draw, 0);
}




shader_reset();