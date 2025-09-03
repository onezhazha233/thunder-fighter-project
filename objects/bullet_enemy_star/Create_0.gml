live;
event_inherited();

line_length = 0

function laser(){
	speed = 0;
	Anim_Destroy(id,"speed");
	for(i=0;i<3;i+=1){
		for(j=0;j<25;j+=1){
			a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = i*120 + 30;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(60*j,a.image_angle),30);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(60*j,a.image_angle),30);
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,30-i,60,60);
		}
		for(j=0;j<25;j+=1){
			a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = i*120 - 30;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(60*j,a.image_angle),30);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(60*j,a.image_angle),30);
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,30-i,60,60);
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