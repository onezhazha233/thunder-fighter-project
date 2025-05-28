live;
event_inherited();

collision_type = COLLISION_TYPE.RECTANGLE
up = 60
down = 60
left = 150
right = 150

Anim_Destroy(id,"inv_damage")

damage_history = ds_list_create();
dpss = ds_list_create();

// DPS 显示用变量（调试或显示）
current_dps = 0;

Hurt = function(){
	if(instance_exists(last_bullet)){
		var dmg = last_bullet.damage;
	    var now = time;
	
		ds_list_add(damage_history, [now, dmg]);
	}
	
	hurt_time = 120;
	if!(Anim_IsExists(id,"blend_g")){
		Anim_Create(id,"blend_g",0,0,0,255,4);
		Anim_Create(id,"blend_b",0,0,0,255,4);
	}
}