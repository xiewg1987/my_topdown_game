extends Node

var save_setting_path := "user://settings.json"


var settings: Dictionary = {
	"music": true,
	"sfx": true,
	"fullscreen": false
}


## 保存配置
func save_date() -> void:
	var data =  settings.duplicate() # 对数据进行拷贝
	var file = FileAccess.open(save_setting_path, FileAccess.WRITE) # 打开文件设置写入操作
	file.store_string(JSON.stringify(data)) # 转成String保存
	file.close() # 关闭文件


## 读取文件
func load_date() -> void:
	if not FileAccess.file_exists(save_setting_path): return # 检查是否存在配置文件
	var file = FileAccess.open(save_setting_path, FileAccess.READ) # 打开文件设置读取操作
	var data = JSON.parse_string(file.get_as_text()) # 读取文件并转成JSON格式
	file.close() # 关闭文件
	settings = data # 获取输出保存至设置
	
