live;
event_inherited();

bg_images = [[spr_bg_battle_galaxy],[spr_bg_battle_galaxy_bg_0],[spr_bg_battle_galaxy_bg_1]]
scroll_speed = [0.1,-1,-3]
bg_offset = [0,random(1000),random(1000)];

bg_height[0] = GetBgHeight(bg_images[0]);
bg_height[1] = 1200
bg_height[2] = 1300