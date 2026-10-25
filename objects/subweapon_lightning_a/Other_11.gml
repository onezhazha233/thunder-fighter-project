live;
/* 原版暴走: 双攻击点(错相30帧)交替 → 每30帧一波, 角度组交错 */
if(bb = false){
	FireLightningVolley(volley_rampage_a[0], volley_rampage_a[1], volley_rampage_a[2], true);
}
else{
	FireLightningVolley(volley_rampage_b[0], volley_rampage_b[1], volley_rampage_b[2], true);
}
bb = !bb;
