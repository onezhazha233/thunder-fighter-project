live;
if(play_shoot_sound){
	audio_play_sound(snd_plane_shoot,0,0);
}
blt = MakePlayerBullet(x,y,bullet_player_plane_overwatcher_a_0)
blt.image_angle = image_angle
blt.direction = image_angle + 90
blt.damage = damage