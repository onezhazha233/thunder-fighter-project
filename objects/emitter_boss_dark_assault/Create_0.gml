live;
event_inherited();

duration = -1
loop = false

rdm_attack = 0
rdm_attack_time = -1
rdm_attack_duration = -1

attack_list = ds_list_create()

function start_attack(attack_type,arg=0){
	attack = {
		type : attack_type,
		time : 0,
		active : true,
		exarg : arg,
		
		End : function(){
			active = false;
		}
	}
	
	ds_list_add(attack_list,attack);
}

function run_attack(attack){
	switch(attack.type){
		case 0: attack_0(attack,attack.exarg); break;
	}
}

function attack_0(attack,exarg=0){
	if(attack.time = 1){
		a = MakeEnemyBullet(x,y+80,bullet_enemy_laser_green);
		a.delay = 30;
		a.duration = 120;
		attack.End();
	}
}