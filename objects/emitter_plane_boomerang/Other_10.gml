live;
// Start a staggered volley: one bullet every 4 frames, alternating direction each volley
fire_count = 2 + weapon_level;
fire_step = 0;
fire_timer = 0;
fire_reverse = !fire_reverse;