live;
blt = MakePlayerBullet(x,y,bullet_player_wingman_railcannon)
blt.sprite_index = spr_bullet_player_railcannon_d
blt.collision_effect = seq_bullet_effect_railcannon_d;
if(dir = 0){
	blt.image_angle += 17;
}
else{
	blt.image_angle -= 17;
}
blt.direction = blt.image_angle + 90
blt.speed = 45
blt.damage = damage