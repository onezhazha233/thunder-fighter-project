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

if(time = 1){
	start_attack(0);
}
if(time = 300){
	start_attack(1);
}
if(time = 450){
	start_attack(2);
}
if(time = 600){
	start_attack(3);
}
if(time = 900){
	rdm_attack = irandom(3);
	rdm_attack_duration = [300,150,150,300];
}
if(time >= 900){
	rdm_attack_time -= 1;
	if(rdm_attack_time <= 0){
		rdm_attack = irandom(3);
		rdm_attack_time = rdm_attack_duration[rdm_attack];
		switch(rdm_attack){
			case 0: start_attack(0); break;
			case 1: start_attack(1); break;
			case 2: start_attack(2); break;
			case 3: start_attack(3); break;
		}
	}
}