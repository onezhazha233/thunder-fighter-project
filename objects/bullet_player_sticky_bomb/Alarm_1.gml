live;
effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,explosion_effect);
effect.sequence = explosion_effect_sequence;
effect.radius = explosion_effect_radius*explosion_effect_scale;
effect.image_xscale = -scale_x*explosion_effect_scale;
effect.image_yscale = scale_y*explosion_effect_scale;
effect.damage = damage*global.atk_subweapon*10;

instance_destroy()