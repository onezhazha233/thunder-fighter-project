live;
if(rampage = false){
	image_xscale = 4;
	image_yscale = 0;
	image_alpha = 1;
	Anim_Create(id,"bgsx",0,0,4,-2,4);
	Anim_Create(id,"bgsy",0,0,0,0.5,4);
	Anim_Create(id,"image_xscale",0,0,image_xscale,1.5-image_xscale,4);
	Anim_Create(id,"image_xscale",0,0,1.5,1,20,4);
	Anim_Create(id,"image_yscale",0,0,image_yscale,2-image_yscale,4);
	Anim_Create(id,"image_yscale",0,0,2,1,10,4);
	Anim_Create(id,"image_yscale",0,0,3,-1,10,14);
}
else{
	Anim_Create(id,"image_alpha",0,0,0,1,10);
	Anim_Create(id,"rsx",0,0,4,-3,10);
	Anim_Create(id,"rsy",0,0,0,1,10);
	pa = 1;
	Anim_Create(id,"pa",0,0,1,-1,15);
	Anim_Create(id,"po",0,0,0,80,15);
	Anim_Create(id,"ps",0,0,0,2,15);
	Anim_Create(id,"ra",0,0,0,0.5,10);
	image_xscale = 4;
	image_yscale = 0;
	Anim_Create(id,"image_xscale",0,0,image_xscale,1.5-image_xscale,4);
	Anim_Create(id,"image_xscale",0,0,1.5,1,20,4);
	Anim_Create(id,"image_yscale",0,0,image_yscale,2-image_yscale,4);
	Anim_Create(id,"image_yscale",0,0,2,1,20,4);
}