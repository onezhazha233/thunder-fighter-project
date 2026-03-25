live;
event_inherited();

//instance_create_depth(x+lengthdir_x(380*abs(image_xscale),image_angle+90)+lengthdir_x(140*image_yscale,image_angle)*(dir=0 ? 1 : -1),y+lengthdir_y(380*abs(image_xscale),image_angle+90)+lengthdir_y(140*image_yscale,image_angle)*(dir=0 ? 1 : -1),0,bullet_player_plane_blade).image_angle = image_angle-10*(dir=0 ? 1 : -1)

dirr = image_angle+90-20*(dir=0 ? 1 : -1)
find = laser_find_width(x,y,dirr,1500,1,enemy,true,true)
len = 1500
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false){
		len = _dist;
		find_enemy = _inst;
		break;
	}
}

instance_create_depth(x+lengthdir_x(len,dirr),y+lengthdir_y(len,dirr),0,bullet_player_plane_blade).image_angle = image_angle-10*(dir=0 ? 1 : -1)
audio_play_sound(snd_plane_blade_shoot_idle,0,0)