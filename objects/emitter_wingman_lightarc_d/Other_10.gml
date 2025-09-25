live;
switch(weapon_level){
	case 0:damage = 0.234375*global.atk_wingman;break;
	case 1:damage = 0.24375*global.atk_wingman;break;
	case 2:damage = 0.2390625*global.atk_wingman;break;
	case 3:damage = 0.1875*global.atk_wingman;break;
}

laser[0] = MakePlayerBullet(x,y,bullet_player_wingman_lightarc_a);
laser[0].image_angle = 90
laser[0].damage = damage;
laser[0].duration = 41
Anim_Create(laser[0],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,laser[0].image_xscale,1-laser[0].image_xscale,10)
Anim_Create(laser[0],"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,90,angle_range,30,10)
Anim_Create(laser[0],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,11,30)
array_push(follow_inst,laser[0]);
laser[1] = MakePlayerBullet(x,y,bullet_player_wingman_lightarc_a);
laser[1].image_angle = 90
laser[1].damage = damage;
laser[1].duration = 41
Anim_Create(laser[1],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,laser[1].image_xscale,1-laser[1].image_xscale,10)
Anim_Create(laser[1],"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN,90,-angle_range,30,10)
Anim_Create(laser[1],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,11,30)
array_push(follow_inst,laser[1]);