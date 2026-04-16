///@arg x
///@arg y
///@arg obj
///@arg spr_or_seq
function MakeEnemyBullet(X,Y,OBJ,SPR_OR_SEQ=-1,IMGSPD=0){
	var bullet = instance_create_depth(X,Y,depth,OBJ);
	if(variable_instance_exists(id,"mark"))bullet.mark = mark;
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
	bullet.image_speed = IMGSPD;
	
	return bullet;
}