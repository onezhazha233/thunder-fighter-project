///@arg x
///@arg y
///@arg obj
///@arg spr_or_seq
function MakeEnemyBullet(){
	var X = argument[0];
	var Y = argument[1];
	var OBJ = argument[2];
	var SPR_OR_SEQ = -1;
	if(argument_count >= 4){
		SPR_OR_SEQ = argument[3];
	}
	
	bullet = instance_create_depth(X,Y,depth,OBJ);
	bullet.mark = mark;
	if(argument_count >= 4){
		if(sprite_exists(SPR_OR_SEQ)){
			bullet.sprite_index = SPR_OR_SEQ;
		}
		if(sequence_exists(SPR_OR_SEQ)){
			with(bullet){
				bullet_sequence = layer_sequence_create(global.layer_bullets_enemy,x,y,SPR_OR_SEQ);
				layer_sequence_xscale(bullet_sequence,scale_x);
				layer_sequence_yscale(bullet_sequence,scale_y);
			}
		}
	}
	
	return bullet;
}