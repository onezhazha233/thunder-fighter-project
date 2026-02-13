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
if(time = 425){
	start_attack(2);
}
if(time = 540){
	start_attack(3);
}
if(time = 600){
	start_attack(4);
}
if(time = 700){
	start_attack(0);
}
if(time = 800){
	start_attack(5);
}
if(time = 1000){
	start_attack(5,40);
}
if(time = 1050){
	start_attack(1);
}
if(time = 1250){
	start_attack(3);
}
if(time = 1300){
	start_attack(4);
}
if(time = 1400){
	rdm_attack = irandom(5);
	rdm_attack_duration = [90,180,125,160,200,250];//0短散弹 1长中散弹 2两侧封位弹 3双闪电球 4长侧封位弹 5双侧封位弹
}
if(time >= 1400){
	rdm_attack_time -= 1;
	if(rdm_attack_time <= 0){
		rdm_attack = irandom(5);
		rdm_attack_time = rdm_attack_duration[rdm_attack];
		switch(rdm_attack){
			case 0: start_attack(0); break;
			case 1: start_attack(1); break;
			case 2: start_attack(2); break;
			case 4: start_attack(5); break;
		}
	}
}
if(rdm_attack_time > 0){
	tt = rdm_attack_duration[rdm_attack] - rdm_attack_time;
	if(rdm_attack = 3){
		if(tt = 1){
			start_attack(3);
		}
		if(tt = 60){
			start_attack(4);
		}
	}
	if(rdm_attack = 5){
		if(tt = 1){
			start_attack(5,40);
		}
		if(tt = 50){
			start_attack(1);
		}
	}
}