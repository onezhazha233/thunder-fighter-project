live;
//frost shield
acd = 0
chance = 0.1

ArmorAbility = function(type,exarg=0){
	if(type = 1){
		if(random(1) < chance&&acd = 0){
			player.hurt_inv = 6;
			player.hurt_downgrade_weapon = false;
			player.hurt_skip_recover = false;
			with(effect_frost)instance_destroy();
			instance_create_depth(player.x,player.y,0,effect_frost);
			acd = 5;
			return 0;
		}
		else{
			return exarg;
		}
	}
}