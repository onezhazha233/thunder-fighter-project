// 暂停/继续所有动画
function Anim_PauseAll(_pause) {
    global._gmu_anim_system.paused = _pause;
    return true;
}