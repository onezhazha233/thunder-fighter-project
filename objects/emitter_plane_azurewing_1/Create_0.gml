live;
event_inherited();

time_interval_idle = [60,50,50,50]

cltime = 0
clduration = -1
cc = 0
xx = x
yy = y

clinfo = []

MakeCleave = function(yoff,scale,dir=0,snd=0){
	var cl = MakePlayerBullet(xx,yy+yoff,bullet_player_plane_azurewing_1);
	cl.scale = scale;
	cl.dir = dir;
	if(snd = 1)SFX_Play(snd_plane_azurewing);
	return cl;
}