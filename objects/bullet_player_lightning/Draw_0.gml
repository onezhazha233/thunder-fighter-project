live;
image_xscale = scale_x
image_yscale = scale_y

/* 原版 FollowBehavior.cycleMove: 贝塞尔飞行 + 终点实时重定位 */
if(standby > 0){
	/* 原版子弹待机帧(params[5]): 悬停后再起飞 */
	standby -= 1;
}
else if(bezier_done = false){
	if(instance_exists(track_inst)){
		target_x = track_inst.x;
		target_y = track_inst.y;
	}
	b_t += track_perm;
	var tt = min(b_t, 1);
	var px = x;
	var py = y;
	var u1 = 1 - tt;
	x = u1*u1*u1*p0x + 3*u1*u1*tt*p1x + 3*u1*tt*tt*p2x + tt*tt*tt*target_x;
	y = u1*u1*u1*p0y + 3*u1*u1*tt*p1y + 3*u1*tt*tt*p2y + tt*tt*tt*target_y;
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

event_inherited();
