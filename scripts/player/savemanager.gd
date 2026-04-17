extends Resource
class_name SaveManager


const SavePath : String = "user://save/"
const SaveName : String = "save.res"

static func SaveGame(data : SaveData) -> void:
	ResourceSaver.save(data, SavePath + SaveName)

static func GetSave() -> SaveData:
	if !ResourceLoader.exists(SavePath + SaveName):
		DirAccess.make_dir_recursive_absolute(SavePath)
		var new_save : SaveData = SaveData.new()
		SaveGame(new_save)
	return ResourceLoader.load(SavePath + SaveName)
