live;
for(i=0;i<8;i+=1){
	txu[i] += spd;
	txd[i] -= spd;
	if(txu[i] >= 440){
		txu[i] -= 170*8;
	}
	if(txd[i] <= -440){
		txd[i] += 170*8;
	}
}