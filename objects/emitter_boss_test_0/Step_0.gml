live;
event_inherited();

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
if(time = 430){
	start_attack(2);
}
if(time = 550){
	start_attack(3);
}
if(time = 580){
	start_attack(4);
}