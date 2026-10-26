live;
event_inherited();

if (enabled) {
	if (bursts_left > 0) {
		if (burst_timer <= 0) {
			FireWarperFan(rampage);
			bursts_left -= 1;
			burst_timer = (rampage ? rampage_biv : idle_biv);
		}
		else {
			burst_timer -= 1;
		}
	}
}
else {
	bursts_left = 0;
	burst_timer = 0;
}
