live;
if (!Anim_IsExists(id, "readygo_time")) {
    instance_destroy();
}

// Draw
readygo_draw(room_width / 2, 560, readygo_time);