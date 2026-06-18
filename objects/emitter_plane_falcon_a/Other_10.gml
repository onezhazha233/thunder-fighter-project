live;
laser_scale_target = laser_scale_level[weapon_level]

for(i=0;i<1;i+=1){
	if(!instance_exists(laser[i])){
		laser[i] = MakePlayerBullet(x,y,bullet_player_plane_falcon);
		laser[i].SetSequence(seq_bullet_player_falcon_a_fire);
		laser[i].scale_x = scale_x;
		laser[i].scale_y = scale_y;
		laser[i].image_angle = 36*i;
		laser[i].image_yscale = laser_scale;
		laser[i].damage = damage;
		laser[i].width = 60;
		laser[i].range = 500;
		laser[i].rampage = false;
		follow_inst[i] = laser[i];
	}
	else if(laser[i].sequence != seq_bullet_player_falcon_a_fire){
		laser[i].SetSequence(seq_bullet_player_falcon_a_fire);
		laser[i].width = 60;
		laser[i].range = 500;
		laser[i].rampage = false;
	}
	else{
		laser[i].scale_x = scale_x;
		laser[i].scale_y = scale_y;
		laser[i].image_yscale = laser_scale;
		laser[i].damage = damage;
		laser[i].width = 60;
		laser[i].range = 500;
		laser[i].rampage = false;
	}
}

ring_time += 1
if(ring_time mod 10 = 0){
	ring = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_effect_falcon_ring);
	ring.sequence = seq_bullet_player_falcon_a_ring;
	ring.image_xscale = scale_x*0.75;
	ring.image_yscale = laser_scale*0.6;
	array_push(follow_inst,ring);
}

if!(audio_is_playing(snd_plane_falcon_idle)){
	SFX_Play(snd_plane_falcon_idle);
	alarm[2] = 40;
}