///@arg x
///@arg y
///@arg obj
///@arg seq*
function MakePlayerBullet(){
	var X = argument[0];
	var Y = argument[1];
	var OBJ = argument[2];
	var SEQ = -1;
	if(argument_count >= 4){
		SEQ = argument[3];
	}
	
	var bullet = instance_create_depth(X,Y,depth,OBJ);
	bullet.scale_x = scale_x;
	bullet.scale_y = scale_y;
	if(argument_count >= 4){
		with(bullet){
			bullet_sequence = layer_sequence_create(global.layer_bullets_player,x,y,SEQ);
			layer_sequence_xscale(bullet_sequence,scale_x);
			layer_sequence_yscale(bullet_sequence,scale_y);
		}
	}
	
	return bullet;
}