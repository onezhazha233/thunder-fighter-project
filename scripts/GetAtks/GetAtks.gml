function GetAtkPlane(){
	var atk = global.atk_plane;
	for(var i=0;i<array_length(global.atk_plane_bonus);i+=1){
		atk += global.atk_plane_bonus[i].value;
	}
	var atk_mul = 0;
	for(var i=0;i<array_length(global.atk_all_bonus);i+=1){
		atk_mul += global.atk_all_bonus[i].value;
	}
	atk *= (1+atk_mul);
	return atk;
}
function GetAtkWingman(){
	var atk = global.atk_wingman;
	for(var i=0;i<array_length(global.atk_wingman_bonus);i+=1){
		atk += global.atk_wingman_bonus[i].value;
	}
	var atk_mul = 0;
	for(var i=0;i<array_length(global.atk_all_bonus);i+=1){
		atk_mul += global.atk_all_bonus[i].value;
	}
	atk *= (1+atk_mul);
	return atk;
}
function GetAtkSubweapon(){
	var atk = global.atk_subweapon;
	for(var i=0;i<array_length(global.atk_subweapon_bonus);i+=1){
		atk += global.atk_subweapon_bonus[i].value;
	}
	var atk_mul = 0;
	for(var i=0;i<array_length(global.atk_all_bonus);i+=1){
		atk_mul += global.atk_all_bonus[i].value;
	}
	atk *= (1+atk_mul);
	return atk;
}