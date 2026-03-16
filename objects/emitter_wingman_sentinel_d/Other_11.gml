live;
if(!instance_exists(rampage_laser)){
	rampage_laser = MakePlayerBullet(x,y,bullet_player_wingman_sentinel_laser);
	rampage_laser.image_angle = 90;
	rampage_laser.duration = -1;
	rampage_laser.image_blend = c_white;
	rampage_laser.wave_time = 0;
	rampage_laser.fade_out = false;
	rampage_laser.fade_time = 0;
	rampage_laser.damage = damage;
	Anim_Destroy(rampage_laser,"image_xscale");
	array_push(follow_inst,[rampage_laser,-sign(0.5-dir)*20*scale_x,-30]);
}
if(instance_exists(rampage_laser)){
	if!(rampage_laser.fade_out){
		rampage_laser.wave_time += 1;
		if(rampage_laser.wave_time <= 6){
			rampage_laser.image_xscale = rampage_laser.wave_time/6;
		} else {
			var wt = (rampage_laser.wave_time-6)/10;
			rampage_laser.image_xscale = 0.9 + 0.1*sin(wt*2*pi);
		}
	}
}