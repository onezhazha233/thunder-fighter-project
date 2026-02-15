live;
for(i=0;i<ds_list_size(attack_list);i+=1){
	attack = attack_list[|i];
	if(attack.active = true){
		attack.time += 1;
		run_attack(attack);
	}
	else{
		ds_list_delete(attack_list,i);
	}
}

if(time = 30){
	start_attack(0);
}
if(time = 120){
	start_attack(1);
}
if(time = 300){
	start_attack(2);
}
if(time = 400){
	start_attack(3);
}
if(time = 580){
	start_attack(4);
}
if(time = 680){
	start_attack(0);
}
if(time = 740){
	start_attack(4);
}
if(time = 800){
	start_attack(1);
}
if(time = 940){
	start_attack(3);
}
if(time = 1140){
	start_attack(2);
}
if(time = 1240){
	start_attack(0);
}
if(time = 1340){
	start_attack(1);
}
if(time = 1520){
	rdm_attack = irandom(4);
	rdm_attack_duration = [90,180,90,200,100];
}
if(time >= 1520){
	rdm_attack_time -= 1;
	if(rdm_attack_time <= 0){
		var _count = array_length(rdm_attack_duration);
		if(_count <= 1){
			rdm_attack = 0;
		}
		else{
			rdm_attack = irandom(_count-1);
			while(rdm_attack = last_attack){
				rdm_attack = irandom(_count-1);
			}
		}
		last_attack = rdm_attack;
		rdm_attack_time = rdm_attack_duration[rdm_attack];
		switch(rdm_attack){
			case 0: start_attack(0); break;
			case 1: start_attack(1); break;
			case 2: start_attack(2); break;
			case 3: start_attack(3); break;
			case 4: start_attack(4); break;
		}
	}
}
