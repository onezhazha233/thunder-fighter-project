live;
event_inherited();

enemy = new Enemy(enemy_0a,noone,function(){
	if(time = 1){
		x = 800+ox;
		y = 100+oy;
		image_angle = -60;
		Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,-880+ox,120);
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,880/2+oy,120);
	}
	if(time = 120){
		instance_destroy();
	}
})