live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

scale = 0.5
Anim_Create(id,"scale",0,0,scale,1-scale,5)
image_alpha = 0
Anim_Create(id,"image_alpha",0,0,0,1,5)

dir = 0//0为向右溅射 1为向左溅射
piece_sprite = spr_bolide_a_piece_0
piece_tail_sprite = spr_bolide_a_piece_1
piece_number = 2
piece_anglerange = 10

vspeed = -30

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	var count = max(0,piece_number);
	if(count <= 0)exit;
	var base_dir = (dir = 0 ? 0 : 180);
	var step = (count > 1) ? (piece_anglerange*2)/(count-1) : 0;
	for(var i=0;i<count;i+=1){
		var ang = base_dir - piece_anglerange + step*i;
		var p = MakePlayerBullet(x,y,bullet_player_bolide_piece);
		p.sprite_index = piece_sprite;
		p.tail_sprite = piece_tail_sprite;
		p.direction = ang;
		p.image_angle = ang;
		p.speed = speed;
		p.damage = damage;
	}
}