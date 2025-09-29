function MakeCrystal(x,y,type,gravity_enabled=true){
	var crystal = instance_create_depth(x,y,0,battle_item_crystal);
	crystal.type = type;
	crystal.gravity_enabled = gravity_enabled;
	
	return crystal;
}