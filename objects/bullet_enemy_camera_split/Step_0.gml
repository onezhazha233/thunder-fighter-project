live;
event_inherited();

delay -= 1
if(delay >= 0){
	rr = random_range(-1,1);
	x = xstart + lengthdir_x(rr*(delay),image_angle+90);
	y = ystart + lengthdir_y(rr*(delay),image_angle+90);
}

if(delay = -30){
	mask_index = sprite_index;
	image_blend = -1;
	image_yscale = 20;
	Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,20,-20,10,0,function(){
		mask_index = -1;
		visible = false;
	});
	cs0 = instance_create_depth(x,y,0,camera_split);
	cs0.image_angle = image_angle+90;
	cs1 = instance_create_depth(x,y,0,camera_split);
	cs1.image_angle = image_angle-90;
	Camera_Shake(8,8,2,2,1,1);
	duration = 300;
	Anim_Create(id,"oo",0,0,0,pi/2,60);
}

if(instance_exists(cs0)){
	cs0.offset = sin((delay+30)/30)*60;
	if(delay < -60){
		cs1.offset = sin((delay+60)/30)*60;
	}
}