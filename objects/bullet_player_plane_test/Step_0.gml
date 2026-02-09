live;
event_inherited();

if(enabled = true){
	if(type = 0){
		direction += rot;
		blt = instance_create_depth(x,y,depth+1,bullet_player_plane_test);
		blt.image_xscale = image_xscale;
		blt.image_yscale = image_yscale;
		blt.direction = direction;
		blt.speed = 0;
		blt.type = 1;
		blt.collision_type = COLLISION_TYPE.RECTANGLE;
		blt.up = 0;
		blt.down = 0;
		blt.left = 0;
		blt.right = 0;
		duration -= 1;
		if(duration = 0){
			Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,image_xscale,-image_xscale,10);
			Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,image_yscale,-image_yscale,10);
			alarm[1] = 10;
		}
	}
}
image_angle = direction