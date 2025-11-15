live;
image_xscale = scale_x*0.7
image_yscale = scale_y*0.7

if(track_inst_exists = 1){
	if(!instance_exists(track_inst)&&turn_timer < 20){
		turn_timer = 0;
	}
}
if(instance_exists(track_inst)){
    target_x = track_inst.x;
    target_y = track_inst.y;
}

var tx = target_x;
var ty = target_y;

if (turn_timer > 0) {
    var want = point_direction(x, y, tx, ty);
    var cur = point_direction(0, 0, hspeed, vspeed);
    var d = angle_difference(want, cur);
    d = clamp(d, -max_turn, max_turn);
    var new_ang = cur + d * turn_speed;

    var spd = point_distance(0, 0, hspeed, vspeed);
    spd = min(max_speed, spd + accel*(1+rampage/2));

    hspeed = lengthdir_x(spd, new_ang);
    vspeed = lengthdir_y(spd, new_ang);

    turn_timer -= 1;
} else {
    var spd = point_distance(0, 0, hspeed, vspeed);
    spd = min(max_speed, spd + accel*(1+rampage/2));
    var ang = point_direction(0, 0, hspeed, vspeed);
    hspeed = lengthdir_x(spd, ang);
    vspeed = lengthdir_y(spd, ang);
}

direction = point_direction(0, 0, hspeed, vspeed);
image_angle = direction - 90;

draw_sprite_ext(sprite_index,tail_image,x,y,image_xscale*scale_x,image_yscale*scale_y*tail_scale,image_angle,-1,1)
draw_self()

event_inherited();