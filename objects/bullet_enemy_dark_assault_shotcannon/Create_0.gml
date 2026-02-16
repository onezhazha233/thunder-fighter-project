live;
event_inherited()

depth = DEPTH_BATTLE.BULLETS_ENEMY - 50
ll = layer_create(depth)

time = 0

mark = noone

delay = 0
duration = 60

interval = 20

inv_block = true

scseq = layer_sequence_create(ll,x,y,seq_bullet_enemy_dark_assault_shotcannon_intro)

dd = 0