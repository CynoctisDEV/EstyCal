extends Node

#-----------------------------------------------------------------------
#Code and Design created by Alexsander Oliveira de Almeida - April/2024.
#Visit my Github on -> https://github.com/CynoctisDEV
#-----------------------------------------------------------------------

#Preloads ----------
var sdn_broken = preload("res://DATA/SOUND/broken.wav")
var snd_clear = preload("res://DATA/SOUND/clear.wav")
var snd_number_select = preload("res://DATA/SOUND/operator_select.wav")
var snd_operator_select = preload("res://DATA/SOUND/operator_select.wav")

#Variable ----------
var dot_selected: bool = false
var operator_selected: bool = false
var operator: String = ""
var result_selected: bool = false
var result_value: float = 0
var first_value: String = "0"
var second_value: String = "0"
var limit_value: int = 24

#Node ----------
@onready var screen: Label = $control_ui/layer_ui/screen_text
@onready var animations: AnimationPlayer = $control_animation/animations
@onready var skull_sprites: AnimatedSprite2D = $control_animation/layer_animation/skull_sprites
@onready var label_broken: Label = $control_animation/layer_animation/label_broken
@onready var sound_number: AudioStreamPlayer = $sound_number
@onready var sound_operator: AudioStreamPlayer = $sound_operator
@onready var sound_clear: AudioStreamPlayer = $sound_clear
@onready var sound_broken: AudioStreamPlayer = $sound_broken

@onready var all_buttom = get_tree().get_nodes_in_group("buttom")

#Godot native method ----------
func _ready():
	
	#default animations status
	animations.play("RESET")
	#Deafult number in screen
	screen.text = first_value

func _process(delta):
	#Showing the values ​​on the screen
	if result_selected == false and operator_selected == false:
		screen.text = first_value
	elif  result_selected == false and operator_selected == true:
		screen.text = second_value
	else:
		#If the result is greater than the calculator's display, then the result is converted into
		#scientific notation to fit on the display.
		if str(result_value).length() > 24:
			screen.text = "ERROR, THIS NUMBER  IS SO LONG"
			screen.label_settings.font_size = 60
		else:
			screen.text = str(result_value)
			screen.label_settings.font_size = 100

#region MY METHOD ----------
func add_number(number, value):
	#add number in numbers variables.
	if number == "first":
		first_value += value
	elif number == "second":
		second_value += value
		
func remove_number(number):
	#remove the last number in variable
	if number == "first":
		var stringg = first_value.left(first_value.length() - 1)
		first_value = stringg
	elif number == "second":
		var stringg = second_value.left(second_value.length() - 1)
		second_value = stringg
		
func result_calculator():
	#Perform the calculation of the chosen operation with the previously entered numbers.
	match operator:
		"sum":
			result_value = float(first_value) + float(second_value)
			result_selected = true
			
		"minus":
			result_value = float(first_value) - float(second_value)
			result_selected = true
			
		"multiplication":
			result_value = float(first_value) * float(second_value)
			result_selected = true
			
		"division":
			if second_value != "0":
				result_value = float(first_value) / float(second_value)
				result_selected = true
			else:
				skull_sprites.play("skull_base")
				animations.play("broken_intro")
				for buttom in all_buttom:
					buttom.disabled = true
				
			
func clear():
	$control_ui/layer_ui/label_clear.visible = true
	$control_ui/layer_ui/screen_text.visible = false
	animations.play("clear")
	sound_clear.stop()
	sound_clear.play()
	for buttom in all_buttom:
		buttom.disabled = true
		
func limit_output(value):
	pass
	
		
#endregion

#region NUMBERS
func _on_numb_0_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		if first_value.length() < 24:
			#Add number to first value before choosing the operation.
			if first_value != "0" :
				add_number("first", "0")
			else:
				first_value = "0"
	elif operator_selected == true and result_selected == false:
		if second_value.length() < 24:
			#Add number to second value after choosing the operation.
			if second_value != "0":
				add_number("second", "0")
			else:
				second_value = "0"

func _on_numb_1_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "1")
			else:
				first_value = "1"
	elif operator_selected == true and result_selected == false:
		if second_value.length() < 24:
		#Add number to second value after choosing the operation.
			if second_value != "0":
				add_number("second", "1")
			else:
				second_value = "1"


func _on_numb_2_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "2")
			else:
				first_value = "2"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "2")
			else:
				second_value = "2"


func _on_numb_3_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "3")
			else:
				first_value = "3"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "3")
			else:
				second_value = "3"


func _on_numb_4_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "4")
			else:
				first_value = "4"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "4")
			else:
				second_value = "4"


func _on_numb_5_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "5")
			else:
				first_value = "5"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "5")
			else:
				second_value = "5"


func _on_numb_6_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "6")
			else:
				first_value = "6"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "6")
			else:
				second_value = "6"


func _on_numb_7_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "7")
			else:
				first_value = "7"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "7")
			else:
				second_value = "7"


func _on_numb_8_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "8")
			else:
				first_value = "8"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "8")
			else:
				second_value = "8"


func _on_numb_9_button_down():
	sound_number.play()
	if operator_selected == false and result_selected == false:
		#Add number to first value before choosing the operation.
		if first_value.length() < 24:
			if first_value != "0":
				add_number("first", "9")
			else:
				first_value = "9"
	elif operator_selected == true and result_selected == false:
		#Add number to second value after choosing the operation.
		if second_value.length() < 24:
			if second_value != "0":
				add_number("second", "9")
			else:
				second_value = "9"
#endregion

#region OPERATOR
func _on_sum_button_down():
	sound_operator.play()
	if operator_selected == false:
		operator = "sum"
		operator_selected = true
		dot_selected = false
	else:
		pass


func _on_minus_button_down():
	sound_operator.play()
	if operator_selected == false:
		operator = "minus"
		operator_selected = true
		dot_selected = false
	else:
		pass


func _on_multiplication_button_down():
	sound_operator.play()
	if operator_selected == false:
		operator = "multiplication"
		operator_selected = true
		dot_selected = false
	else:
		pass


func _on_division_button_down():
	sound_operator.play()
	if operator_selected == false:
		operator = "division"
		operator_selected = true
		dot_selected = false
	else:
		pass


func _on_equals_button_down():
	sound_operator.play()
	if operator_selected == true and result_selected == false:
		result_calculator()
		dot_selected = false
	else:
		pass


func _on_clear_button_down():
	#Clear/reset calculator data.
	clear()


func _on_dot_button_down():
	sound_operator.play()
	if dot_selected == false:
		if operator_selected == false:
			#Add dot to first value before choosing the operation.
			add_number("first", ".")
			dot_selected = true
		else:
			#Add dot to second value after choosing the operation.
			add_number("second", ".")
			dot_selected = true
		
		
func _on_back_button_down():
	sound_operator.play()
	if operator_selected == false:
		if first_value != "0" and first_value.length() > 1:
			remove_number("first")
		else:
			first_value = "0"
	else:
		#Add number to second value after choosing the operation.
		if second_value != "0" and second_value.length() > 1:
			remove_number("second")
		else:
			second_value = "0"

#endregion

#region ANIMATIONS
#When the animations of the animation node end.
func _on_animations_animation_finished(anim_name):
	if anim_name == "broken_intro":
		skull_sprites.play("skull_laugh")
		sound_broken.play()
		
	elif anim_name == "broken":
		skull_sprites.visible = false
		label_broken.visible = false
		clear()
		
	elif  anim_name == "clear":
		for buttom in all_buttom:
			buttom.disabled = false
		operator_selected = false
		result_selected = false
		first_value = "0"
		second_value = "0"
		$control_ui/layer_ui/label_clear.visible = false
		$control_ui/layer_ui/screen_text.visible = true

#When the animations of the animatedsprites node end.
func _on_skull_sprites_animation_finished():
	if skull_sprites.animation == "skull_laugh":
		animations.play("broken")

#endregion
	
