zspeed -= grav;

if (c_raycast_world(x, y, z, x + xspeed, y + yspeed, z + zspeed, 1)) {
    xspeed = 0;
    yspeed = 0;
    zspeed = 0;
    grav = 0;
    
    show_debug_message("Distance to collision: " + string(point_distance_3d(x, y, z, c_hit_x(), c_hit_y(), c_hit_z())));
    
    x = c_hit_x();
    y = c_hit_y();
    z = c_hit_z();
}

x += xspeed;
y += yspeed;
z += zspeed;