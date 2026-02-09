live;
depth = DEPTH_BATTLE.UI
readygo_time = 0;

audio_play_sound(snd_ready,0,0)

// Anim-driven parameters (GMU_Anim)
ready_blue_alpha = 1;
go_scale_main = 0;
go_alpha_main = 1;
go_scale_burst = 1.4;
go_alpha_burst = 0.1960784;

// master time (0..100)
Anim_Create(id, "readygo_time", ANIM_TWEEN.LINEAR, ANIM_EASE.IN, 0, 100, 100);

// Ready blue fade out (58..62)
Anim_Create(id, "ready_blue_alpha", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 1, -1, 4, 58);

// GO main scale: 0 -> 1.4 (52..60), then 1.4 -> 1.0 (60..62)
Anim_Create(id, "go_scale_main", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 0, 1.4, 8, 52);
Anim_Create(id, "go_scale_main", ANIM_TWEEN.QUAD, ANIM_EASE.IN, 1.4, -0.4, 2, 60);

// GO main alpha fade (90..100)
Anim_Create(id, "go_alpha_main", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 1, -1, 10, 90);

// GO burst scale: 1.4 -> 2.2 (60..66)
Anim_Create(id, "go_scale_burst", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 1.4, 0.8, 6, 60);

// GO burst alpha: 0.196 -> 0 (60..66)
Anim_Create(id, "go_alpha_burst", ANIM_TWEEN.LINEAR, ANIM_EASE.OUT, 0.1960784, -0.1960784, 6, 60);

/// readygo_draw(x, y, time)
/// time: 0..100 (60fps)
function readygo_draw(_x, _y, _t)
{
    var t = _t;

    // --- Ready Blue ---
    if (t >= 0 && t < 62) {
        var a = clamp(ready_blue_alpha, 0.0, 1.0);
        draw_set_alpha(a);
        draw_set_color(c_white);
        draw_sprite_ext(spr_ui_readygo_ready_blue, 0, _x, _y, 1, 1, 0, c_white, a);
    }

    // --- Ready White (3 frames) ---
    if (t >= 40 && t < 42) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(spr_ui_readygo_ready_white, 0, _x, _y, 1, 1, 0, c_white, 1);
    }
    if (t >= 44 && t < 46) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(spr_ui_readygo_ready_white, 1, _x, _y, 1, 1, 0, c_white, 1);
    }
    if (t >= 50 && t < 52) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(spr_ui_readygo_ready_white, 2, _x, _y, 1, 1, 0, c_white, 1);
    }

    // --- GO main (52..100) ---
	if(t = 60)audio_play_sound(snd_go,0,0);
    if (t >= 52 && t < 100) {
        var s = max(go_scale_main, 0);
        var a = clamp(go_alpha_main, 0.0, 1.0);
        draw_set_alpha(a);
        draw_set_color(c_white);
        draw_sprite_ext(spr_ui_readygo_go, 0, _x, _y, s, s, 0, c_white, a);
    }

    // --- GO burst (60..67) ---
    if (t >= 60 && t < 67) {
        var s2 = max(go_scale_burst, 0);
        var a2 = clamp(go_alpha_burst, 0.0, 1.0);
        draw_set_alpha(a2);
        draw_set_color(c_white);
        draw_sprite_ext(spr_ui_readygo_go, 0, _x, _y, s2, s2, 0, c_white, a2);
    }

    draw_set_alpha(1);
    draw_set_color(c_white);
}
