live;
image_xscale = scale_x
image_yscale = scale_y

/* 原版: 首帧索敌一次(不重锁); 目标死亡→保持最后终点直线飞完 */
if(acquired = false){
	acquired = true;
	track_inst = find_follow_target();
}

/* 原版 setFollow(20‰, dir): P1=+100u P2=+300u 终点=+1100u (u=出射方向) */
if(bezier_init = false){
	bezier_init = true;
	p0x = x;
	p0y = y;
	p1x = x + lengthdir_x(100, direction);
	p1y = y + lengthdir_y(100, direction);
	p2x = x + lengthdir_x(300, direction);
	p2y = y + lengthdir_y(300, direction);
	end_x = x + lengthdir_x(1100, direction);
	end_y = y + lengthdir_y(1100, direction);
}

/* 原版 FollowBehavior.cycleMove: 终点每帧跟随目标(控制点固定) */
if(instance_exists(track_inst)){
	end_x = track_inst.x;
	end_y = track_inst.y;
}

if(bezier_done = false){
	b_t += track_perm;
	var tt = min(b_t, 1);
	var px = x;
	var py = y;
	var u1 = 1 - tt;
	x = u1*u1*u1*p0x + 3*u1*u1*tt*p1x + 3*u1*tt*tt*p2x + tt*tt*tt*end_x;
	y = u1*u1*u1*p0y + 3*u1*u1*tt*p1y + 3*u1*tt*tt*p2y + tt*tt*tt*end_y;
	var ddx = x - px;
	var ddy = y - py;
	if(ddx*ddx + ddy*ddy > 0.0001){
		direction = point_direction(px, py, x, y);
	}
	if(b_t >= 1){
		bezier_done = true;
		speed = init_v;
	}
}

image_angle = direction - 90;

if(layer_sequence_is_finished(bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
	bullet_sequence = layer_sequence_create(global.layer_bullets_player,x,y,idle);
}

event_inherited();
