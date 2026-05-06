Anim_Init()

display_set_gui_size(720,1280)

BGM_Init()

Lang_Init()
Lang_LoadList()
Lang_LoadString(0)
Lang_LoadSprite(0)
Lang_LoadFont(0)

GlobalInit()
randomize()

instance_create_depth(0,0,0,camera)
instance_create_depth(0,0,0,fader)

instance_create_depth(0,0,0,debugger)

instance_create_depth(0,0,0,oSteadyDeltaTime)

room_goto_next()