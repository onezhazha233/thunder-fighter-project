live;
event_inherited();

damage = 2*Flag_Get(FLAG_SETTINGS,"enemy_damage_ratio")

line_length = 0

laser = function(){
	speed = 0;
	Anim_Destroy(id,"speed");
	/* 每颗 star 出 6 条径向光带: 3 组 x 2 侧, 每组 14 段, 段距 85px
	   (光条 spr_bullet_enemy_normal_2 长 89px > 85px, 光带仍连续)
	   三段式: 0-30 帧缓动定位到 85j -> 停留 -> 60 帧后 speed 缓动射出 */
	for(i=0;i<3;i+=1){
		for(j=0;j<14;j+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			blt.image_angle = i*120 + 30;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(85*j,blt.image_angle),30);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(85*j,blt.image_angle),30);
			blt.direction = blt.image_angle;
			Anim_Create(blt,"speed",0,0,0,30-i,60,60);
		}
		for(j=0;j<14;j+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			blt.image_angle = i*120 - 30;
			Anim_Create(blt,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(85*j,blt.image_angle),30);
			Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(85*j,blt.image_angle),30);
			blt.direction = blt.image_angle;
			Anim_Create(blt,"speed",0,0,0,30-i,60,60);
		}
	}
	duration = 30;
	collision_mask_enabled = true;
	collision_mask_type = 2;
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,30);
	Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,30);
	Anim_Create(id,"image_alpha",0,0,1,-1,30);
}

bb = 255