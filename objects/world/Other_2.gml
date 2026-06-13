Anim_Init()
Flag_Init()

display_set_gui_size(720,1280)
draw_enable_skeleton_blendmodes(true)

UIInit()

BGM_Init()

lang = Flag_Get(FLAG_SETTINGS,"language")

Lang_Init()
Lang_LoadList()
Lang_LoadString(lang)
Lang_LoadSprite(lang)
Lang_LoadFont(lang)

randomize()

instance_create_depth(0,0,0,camera)
instance_create_depth(0,0,0,fader)
instance_create_depth(0,0,0,battle_ui_pause)

instance_create_depth(0,0,0,debugger)

instance_create_depth(0,0,0,oSteadyDeltaTime)

Flag_SetSlot(0)
Flag_Load(FLAG_SETTINGS)
Flag_Load(FLAG_STATIC)

GlobalInit()

room_goto_next()