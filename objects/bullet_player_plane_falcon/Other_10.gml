live;
event_inherited();

enemy.burn_amount += 1
enemy.burn_damage = damage*0.5
if(enemy.GetBurn() > 0){
	enemy.SetBurn(enemy.burn_time);
}