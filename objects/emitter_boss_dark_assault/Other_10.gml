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

if(time >= 1){
	rdm_attack_time -= 1;
	if(rdm_attack_time <= 0){
		rdm_attack = 0;
		rdm_attack_time = 5;
		switch(rdm_attack){
			case 0: start_attack(0); break;
		}
	}
}