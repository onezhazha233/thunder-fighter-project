function Lang_Custom() {
	#macro GMU_LANG_PATH_BASE global._gmu_lang_path
	#macro GMU_LANG_PATH_FONT "font/"
	#macro GMU_LANG_FONT_REGISTRY "fonts.json"
	// 语言清单文件名（位于 locale/ 下）。移动端无法枚举游戏包内文件，
	// 必须在此显式登记；新增语言时把对应的 xxx.json 加进来即可。
	#macro GMU_LANG_MANIFESTS ["chinese.json","english.json"]
}