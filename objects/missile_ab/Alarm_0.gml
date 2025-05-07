if(rampage = 0){
	subweapon_sequence = layer_sequence_create("bullets_player",x,y,seq_missile_ab_idle_intro);
}
else{
	subweapon_sequence = layer_sequence_create("bullets_player",x,y,seq_missile_ab_rampage_intro);
}
layer_sequence_xscale(subweapon_sequence,image_xscale);
layer_sequence_yscale(subweapon_sequence,image_yscale);
layer_sequence_angle(subweapon_sequence,image_angle);