live;
if(play_shoot_sound){
	SFX_Play(snd_plane_shoot);
}
blt = MakePlayerBullet(x,y,bullet_player_plane_overwatcher_a_1)
blt.image_angle = image_angle
blt.direction = image_angle + 90
blt.damage = damage