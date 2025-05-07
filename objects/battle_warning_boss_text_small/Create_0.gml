live;
image_alpha = 0
image_xscale = 10
image_yscale = 10
spd = 0
yo = 50
for(i=0;i<8;i+=1){
	txu[i] = 450-i*170;
	txd[i] = -450+i*170;
}
Anim_Create(id,"image_alpha",0,0,0,1,26,64)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,image_xscale,1-image_xscale,26,64)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,image_xscale,1-image_xscale,26,64)
Anim_Create(id,"image_alpha",0,0,1,-1,10,210)
Anim_Create(id,"spd",0,0,0,9.5,0,90)
Anim_Create(id,"yo",0,0,yo,-yo,26,64)