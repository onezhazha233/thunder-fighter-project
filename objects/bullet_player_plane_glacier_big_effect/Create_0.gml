live;
image_speed = 0;

scale_x = 1
scale_y = 1
offset_x = 0;
offset_y = -50;  // 初始Y偏移
image_xscale = 0.8;
image_yscale = 0.8;
image_angle = 0;
image_alpha = 1;

// 设置销毁时间（16帧）
alarm[0] = 16;

Anim_Create(id, "image_xscale", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 0.8, 0.2, 2);
Anim_Create(id, "image_yscale", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 0.8, 0.2, 2);

Anim_Create(id, "image_xscale", 0,0, 1.0, 0.3, 0, 5);
Anim_Create(id, "image_yscale", 0,0, 1.0, 0.3, 0, 5);

Anim_Create(id, "image_xscale", 0,0, 1.3, -0.3, 0, 7);
Anim_Create(id, "image_yscale", 0,0, 1.3, -0.3, 0, 7);

Anim_Create(id, "offset_y", 0,0, -50, 10, 0, 6);

Anim_Create(id, "offset_y", 0,0, -40, -20, 0, 7);

Anim_Create(id, "offset_y", ANIM_TWEEN.QUAD,ANIM_EASE.OUT, -60, -30, 8, 8);

Anim_Create(id, "offset_x", 0,0, 0, 12, 0, 6);

Anim_Create(id, "offset_x", 0,0, 12, -19, 0, 7);
Anim_Create(id, "image_index", 0,0, 0, 4, 8);

Anim_Create(id, "image_alpha", 0,0, 1, -1, 8, 8);