live;
xoff = [80,160,120,200,240]
yoff = [0,0,-50,-50,0]
spd = [0,0,1,1,0]

damage = 0.053571*global.atk_subweapon

for(i=0;i<5;i+=1){
	sb = MakePlayerBullet(x,y,bullet_player_sticky_bomb);
	sb.sprite_index = spr_sticky_bomb_d;
	sb.flame = spr_sticky_bomb_cd_flame;
	sb.image_angle = 90;
	sb.direction = sb.image_angle + 90;
	sb.rampage = true;
	sb.delay = 60;
	sb.damage = damage;
	Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,-xoff[i],10);
	Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,yoff[i],10);
	Anim_Create(sb,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,90,-90,10);
	Anim_Create(sb,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.direction,-90,10);
	Anim_Create(sb,"speed",0,0,0,25+spd[i]*3,20,10);

	sb = MakePlayerBullet(x,y,bullet_player_sticky_bomb);
	sb.sprite_index = spr_sticky_bomb_d;
	sb.flame = spr_sticky_bomb_cd_flame;
	sb.image_angle = -90;
	sb.direction = sb.image_angle - 90;
	sb.rampage = true;
	sb.delay = 60;
	sb.damage = damage;
	Anim_Create(sb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.x,xoff[i],10);
	Anim_Create(sb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.y,yoff[i],10);
	Anim_Create(sb,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,-90,90,10);
	Anim_Create(sb,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,sb.direction,-90,10);
	Anim_Create(sb,"speed",0,0,0,25+spd[i]*3,20,10);
}