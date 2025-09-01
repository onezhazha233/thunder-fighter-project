live;
event_inherited();

draw_set_color(-1)
draw_text(x,y+300,time)
draw_text(x,y+330,move_starttime)
draw_text(x,y+360,move_nexttime)
draw_text(x,y+390,move_state)
draw_text(x,y+420,string(x)+" "+string(y)+" \n"+string(move_targetpos[0])+" "+string(move_targetpos[1]))