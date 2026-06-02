live;
main_ui.UpdatePosition()
main_ui.Update()
main_ui.ProcessInput()

time += 1
if(time = 250){
	preview_inst.SetRampage(true);
}
if(time = 450){
	preview_inst.SetRampage(false);
	time = 0;
}