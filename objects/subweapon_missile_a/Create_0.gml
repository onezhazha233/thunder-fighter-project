live;
event_inherited();

/* —— 原版数据(跟踪导弹 zidang50, 暴走51) ——
   常态 1攻击点[45-135], 每点2弹, iv=80/70/60/50, attackRate 300/400/500/500%
   暴走 1攻击点[45-135], iv=50, attackRate 1000%
   伤害按GM工程DPS标定换算(等级0-3: 7.5/9.75/12.75/15, 暴走30 DPS; ×GetAtkSubweapon)
   每发 = DPS×iv/(60×每波弹数2) */
time_interval_idle = [80,70,60,50]
time_interval_rampage = 50

damages = [5,5.6875,6.375,6.25,12.5]
type = 2