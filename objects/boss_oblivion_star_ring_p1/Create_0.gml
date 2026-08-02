live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
mask_index = spr_enemy_boss_large_og2_bottom_0

idle_mode = ENEMY_IDLE_MODE.SEQUENCE

pre_sequence = seq_enemy_boss_large_og2_p1_intro
intro_sequence = seq_enemy_boss_large_og2_p1_intro

for(i=0;i<5;i+=1){
	variable_instance_set(id,"layer_enemy_"+string(i),layer_create(depth-i));
	variable_instance_set(id,"enemy_sequence_"+string(i),-1);
	variable_instance_set(id,"idle_sequence_"+string(i),asset_get_index("seq_enemy_boss_large_og2_p1_idle_"+string(i)));
}

explosion = effect_explosion_boss

bgm = bgm_boss_large

hp_max = 2000*Flag_Get(FLAG_SETTINGS,"boss_hp_ratio")
hp = 1

Anim_Create(id,"hp",0,0,hp,hp_max-hp,40)

x = 360
y = -500

y_target = 350

bullet_emitter = emitter_boss_oblivion_star_ring_p1

items = [[[battle_item_quantum_shield,battle_item_weapon_upgrade],1]]
value = 1000

ring_angle = 0
gun_angle = 0