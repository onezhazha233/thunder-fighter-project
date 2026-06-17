live;
angle = angles[angle_index]-90
angle_index += 1

blt = MakePlayerBullet(x,y,bullet_player_wingman_sniper_c)
if(dir = 0)blt.image_angle = angle;
if(dir = 1){
	blt.image_angle = -angle;
	blt.scale_x *= -1;
}
blt.direction = blt.image_angle + 90
blt.damage = damage
blt.rampage = true
fire = instance_create_depth(x,y,DEPTH_BATTLE.EFFECTS,bullet_effect_sniper_fire);
fire.image_angle = blt.image_angle
array_push(follow_inst,[fire,lengthdir_x(70*scale_x,blt.direction),lengthdir_y(70*scale_y,blt.direction)])