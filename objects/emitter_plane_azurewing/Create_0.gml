live;
event_inherited();

time_interval_idle = [60,50,50,50]
time_interval_rampage = 4

cltime = 0
clduration = -1
cc = 0
xx = x
yy = y

clinfo = []

MakeCleave = function(yoff,scale,dir=0,snd=0){
	var cl = MakePlayerBullet(xx,yy+yoff,bullet_player_plane_azurewing);
	cl.scale = scale;
	cl.dir = dir;
	// Force initial pose on the creation frame (before Anim_Step runs)
	cl.angle = 30;
	cl.image_angle = cl.angle * (cl.dir == 0 ? 1 : -1);
	//if(snd = 1)audio_play_sound(snd_plane_azurewing,0,0);
	return cl;
}

rt = 0
rr = 0
