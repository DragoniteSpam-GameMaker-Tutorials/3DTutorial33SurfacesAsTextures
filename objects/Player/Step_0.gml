/// @description Insert description here

if (mouse_lock) {
    #region regular movement
    look_dir -= (window_mouse_get_x() - window_get_width() / 2) / 10;
    look_pitch -= (window_mouse_get_y() - window_get_height() / 2) / 10;
    look_pitch = clamp(look_pitch, -85, 85);
    
    window_mouse_set(window_get_width() / 2, window_get_height() / 2);

    if (keyboard_check_direct(vk_escape)) {
        game_end();
    }

    var move_speed = 4;
    var dx = 0;
    var dy = 0;

    if (keyboard_check(ord("A"))) {
        dx += dsin(look_dir) * move_speed;
        dy += dcos(look_dir) * move_speed;
    }

    if (keyboard_check(ord("D"))) {
        dx -= dsin(look_dir) * move_speed;
        dy -= dcos(look_dir) * move_speed;
    }

    if (keyboard_check(ord("W"))) {
        dx -= dcos(look_dir) * move_speed;
        dy += dsin(look_dir) * move_speed;
    }

    if (keyboard_check(ord("S"))) {
        dx += dcos(look_dir) * move_speed;
        dy -= dsin(look_dir) * move_speed;
    }

    if (!c_overlap_position(c_object, x + dx, y, z)) {
        x += dx;
    }

    if (!c_overlap_position(c_object, x, y + dy, z)) {
        y += dy;
    }
    #endregion
} else {
    if (Camera.view_mat != undefined && Camera.proj_mat != undefined) {
        var mouse_ray = screen_to_world(window_mouse_get_x(), window_mouse_get_y(), Camera.view_mat, Camera.proj_mat);
        
        if (mouse_check_button_pressed(mb_left)) {
            var ball = instance_create_depth(mouse_ray[3], mouse_ray[4], mouse_ray[5], Ball);
            ball.xspeed = 8 * mouse_ray[0];
            ball.yspeed = 8 * mouse_ray[1];
            ball.zspeed = 8 * mouse_ray[2];
            var dist = 1000000;
            if (c_raycast_world(mouse_ray[3], mouse_ray[4], mouse_ray[5],
                mouse_ray[3] + dist * mouse_ray[0], mouse_ray[4] + dist * mouse_ray[1], mouse_ray[5] + dist * mouse_ray[2], 1)) {
                    ball.x = c_hit_x();
                    ball.y = c_hit_y();
                    ball.z = c_hit_z();
                    ball.xspeed = 0;
                    ball.yspeed = 0;
                    ball.zspeed = 0;
            }
        }
    }
    if (!surface_exists(painting_surf)) {
        painting_surf = surface_create(256, 256);
        surface_set_target(painting_surf);
        draw_clear_alpha(c_white, 1);
        surface_reset_target();
    }
    var cull = gpu_get_cullmode();
    gpu_set_cullmode(cull_noculling);
    surface_set_target(painting_surf);
    var mx = window_mouse_get_x() - window_get_width() + 256;
    var my = window_mouse_get_y();
    if (mouse_check_button(mb_left)) {
        draw_line_width_colour(mx, my, mx_previous, my_previous, 4, c_blue, c_blue);
    }
    gpu_set_cullmode(cull);
    mx_previous = mx;
    my_previous = my;
    surface_reset_target();
}

if (keyboard_check_pressed(vk_tab)) {
    mouse_lock = !mouse_lock;
}