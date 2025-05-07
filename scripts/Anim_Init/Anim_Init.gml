function Anim_Init() {
    // GMU_Anim 结构体版本
    global._gmu_anim_system = {
        animations: [],       // 替换原来的 ds_list
        next_id: -10,         // 动画ID计数器
        paused: false         // 全局暂停状态
    };

    // 缓动类型枚举
    enum ANIM_TWEEN {
        LINEAR,
        SINE,
        QUAD,
        CUBIC,
        QUART,
        QUINT,
        EXPO,
        CIRC,
        BACK,
        ELASTIC,
        BOUNCE
    };

    // 缓动方向枚举
    enum ANIM_EASE {
        IN,
        OUT,
        IN_OUT
    };
}