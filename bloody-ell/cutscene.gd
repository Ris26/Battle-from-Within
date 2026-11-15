extends Control

@onready var nama_label = $"dialogbox/nama label"
@onready var text_label = $"dialogbox/tekslabel"
@onready var karakter_kiri = $kiri
@onready var karakter_kanan = $kanan

#dialog
var dialog_list = [{"nama": "Doctor", "teks": "I am very sorry to inform this to you. The sickness has spread, and it has reached stage 4.", "fokus": "kiri"}, {"nama": "Parents", "teks": "*sobs*", "fokus": "kanan"}, {"nama": "Yuri", "teks": "...", "fokus": "kanan"}, {"nama": "Yuri", "teks": "Doc, I have a favor to ask.", "fokus": "kanan"}, {"nama": "Doctor", "teks": "Of course, anything I can do to help.", "fokus": "kiri"}, {"nama": "Yuri", "teks": "I don’t want to give up yet. There are still so many things I can do in life. So please-", "fokus": "kanan"}, {"nama": "Yuri", "teks": "Even if I couldn’t make it in the end, at least I won’t leave a regret of not struggling until the very end.", "fokus": "kanan"}, {"nama": "", "teks": "Meanwhile, The battle continues...", "fokus": "kiri"}]


var index_dialog: int = 0

func _ready() -> void:
	tampilkan_dialog()
	
func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		index_dialog +=1

	if index_dialog < dialog_list.size():
		tampilkan_dialog()
	else:
		pindah_ke_game()
		
		
func tampilkan_dialog() -> void:
	var data = dialog_list[index_dialog]
	nama_label.text = data ["nama"]
	text_label.text = data ["teks"]
	
	if data["fokus"] == "kiri":
		karakter_kiri.modulate = Color(1, 1, 1, 1)
		karakter_kanan.modulate = Color(0.5, 0.5, 0.5, 1)
		
	else:
		karakter_kiri.modulate = Color(0.5, 0.5, 0.5, 1)
		karakter_kanan. modulate = Color(1, 1, 1, 1)
		
func pindah_ke_game() ->  void:
	get_tree().change_scene_to_file("res://game.tscn")
		
