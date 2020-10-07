/// @description Set up 3D things

// Bad things happen if you turn off the depth buffer in 3D
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

gpu_set_cullmode(cull_counterclockwise);

view_mat = undefined;
proj_mat = undefined;

c_init();
c_world_create();

#region vertex format setup
// Vertex format: data must go into vertex buffers in the order defined by this
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();
#endregion

#region shadow vertex buffer
vb_shadow = vertex_create_buffer();
vertex_begin(vb_shadow, vertex_format);

vertex_add_point(vb_shadow, -32, -32, 0,        0, 0, 1,        0, 0,       c_white, 1);
vertex_add_point(vb_shadow,  32, -32, 0,        0, 0, 1,        1, 0,       c_white, 1);
vertex_add_point(vb_shadow,  32,  32, 0,        0, 0, 1,        1, 1,       c_white, 1);

vertex_add_point(vb_shadow,  32,  32, 0,        0, 0, 1,        1, 1,       c_white, 1);
vertex_add_point(vb_shadow, -32,  32, 0,        0, 0, 1,        0, 1,       c_white, 1);
vertex_add_point(vb_shadow, -32, -32, 0,        0, 0, 1,        0, 0,       c_white, 1);

vertex_end(vb_shadow);
#endregion

#region create the grid
vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);

// Create a checkerboard pattern on the floor
var s = 128;

for (var i = 0; i < room_width; i += s) {
    for (var j = 0; j < room_height; j += s) {
        if ((i % (s * 2) == 0 && j % (s * 2) == 0) || (i % (s * 2) > 0 && j % (s * 2) > 0)) {
            var color = c_aqua;
        } else {
            var color = c_white;
        }
        
        #region add data to the vertex buffer
        vertex_add_point(vbuffer, i, j, 0,                  0, 0, 1,        0, 0,       color, 1);
        vertex_add_point(vbuffer, i + s, j, 0,              0, 0, 1,        1, 0,       color, 1);
        vertex_add_point(vbuffer, i + s, j + s, 0,          0, 0, 1,        1, 1,       color, 1);

        vertex_add_point(vbuffer, i + s, j + s, 0,          0, 0, 1,        1, 1,       color, 1);
        vertex_add_point(vbuffer, i, j + s, 0,              0, 0, 1,        0, 1,       color, 1);
        vertex_add_point(vbuffer, i, j, 0,                  0, 0, 1,        0, 0,       color, 1);
        #endregion
    }
}

vertex_end(vbuffer);
#endregion

instance_create_depth(0, 0, 0, Player);

vb_player = load_model("player.d3d");

vb_cube = load_model("cube.d3d");
vb_octagon = load_model("octagon.d3d");

vb_sphere = load_model("sphere.d3d");

vb_one_way_wall = load_model("one-way-wall.d3d");

///////////////////////////////////////////////////

c_shape_cube = c_shape_create();
c_shape_begin_trimesh();
c_shape_load_trimesh("cube.d3d");
c_shape_end_trimesh(c_shape_cube);
c_shape_octagon = c_shape_create();
c_shape_begin_trimesh();
c_shape_load_trimesh("octagon.d3d");
c_shape_end_trimesh(c_shape_octagon);

c_obj_cube = c_object_create(c_shape_cube, -1, 1);
c_world_add_object(c_obj_cube);
c_transform_position(400, 200, 0);
c_object_apply_transform(c_obj_cube);
c_transform_identity();

c_obj_cube_2 = c_object_create(c_shape_cube, -1, 1);
c_world_add_object(c_obj_cube_2);
c_transform_position(300, 300, 0);
c_object_apply_transform(c_obj_cube_2);
c_transform_identity();

c_obj_octagon = c_object_create(c_shape_octagon, -1, 1);
c_world_add_object(c_obj_octagon);
c_transform_position(600, 200, 0);
c_object_apply_transform(c_obj_octagon);
c_transform_identity();