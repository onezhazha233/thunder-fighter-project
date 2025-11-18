live;
a = MakePlayerBullet(x,y,bullet_player_wingman_railcannon)
a.sprite_index = spr_bullet_player_railcannon_d
a.collision_effect_sequence = seq_bullet_effect_railcannon_d;
if(dir = 0){
	a.image_angle += 17;
}
else{
	a.image_angle -= 17;
}
a.direction = a.image_angle + 90
a.speed = 45
a.damage = damage