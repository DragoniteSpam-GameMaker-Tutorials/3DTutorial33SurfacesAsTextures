/// @description Insert description here

z = 0;
look_dir = 0;
look_pitch = 0;
mouse_lock = true;

max_hp = 10;
current_hp = 10;

painting_surf = surface_create(256, 256);
surface_set_target(painting_surf);
draw_clear_alpha(c_white, 1);
surface_reset_target();
mx_previous = -1;
my_previous = -1;