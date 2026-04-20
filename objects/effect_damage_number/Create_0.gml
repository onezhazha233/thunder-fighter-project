live;
depth = DEPTH_BATTLE.ITEM_EFFECTS;

type = 0;      // 0战机 1僚机 2副武器
damage = 1;

scale = 0;

Anim_Create(id,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,2,-1,10)
Anim_Create(id,"vspeed",0,0,0,-2,0,15)
Anim_Create(id,"alpha",0,0,1,-1,15,15,function(){instance_destroy();})