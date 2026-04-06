live;
var _anim_done = false;
if (!is_undefined(global._gmu_anim_step_done)) {
	_anim_done = global._gmu_anim_step_done;
}
global._gmu_anim_step_done = false;
if (!_anim_done) {
	Anim_Step();
}
