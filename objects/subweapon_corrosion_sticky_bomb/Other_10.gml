live;
xoff = [80,160,120]
yoff = [0,0,-50]
spd = [0,0,1]

damage = 1
switch(weapon_level){
	case 0:damage = 0.055556*global.atk_subweapon;break;
	case 1:damage = 0.063194*global.atk_subweapon;break;
	case 2:damage = 0.070833*global.atk_subweapon;break;
	case 3:damage = 0.041667*global.atk_subweapon;break;
}

for(i=0;i<max(1,weapon_level);i+=1){
	sb = MakePlayerBullet(x,y,bullet_player_sticky_bomb);
	sb.sprite_index = spr_sticky_bomb_b;
	sb.flame = spr_sticky_bomb_ab_flame;
	sb.image_angle = 90;
	sb.direction = sb.image_angle + 90;
	sb.delay = 80;
	sb.damage = damage;
	Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,-xoff[i],30);
	Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,yoff[i],30);
	Anim_Create(sb,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,90,-90,30);
	Anim_Create(sb,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.direction,-90,30);
	Anim_Create(sb,"speed",0,0,0,15+spd[i]*2,20,30);

	sb = MakePlayerBullet(x,y,bullet_player_sticky_bomb);
	sb.sprite_index = spr_sticky_bomb_b;
	sb.flame = spr_sticky_bomb_ab_flame;
	sb.image_angle = -90;
	sb.direction = sb.image_angle - 90;
	sb.delay = 80;
	sb.damage = damage;
	Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,xoff[i],30);
	Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,yoff[i],30);
	Anim_Create(sb,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,-90,90,30);
	Anim_Create(sb,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.direction,-90,30);
	Anim_Create(sb,"speed",0,0,0,15+spd[i]*2,20,30);
}