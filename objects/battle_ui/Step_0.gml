live;
main_ui.UpdatePosition()
main_ui.Update()
main_ui.ProcessInput()

for(i=0;i<ds_list_size(buff_list);i+=1){
	buff_list[|i].step();
}