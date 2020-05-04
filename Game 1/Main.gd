extends Control

var Count = 0
var max_count = 5
var Money = 400
var Buy = 10
var Base = 5
var Upgrade = 300

func _on_Timer_timeout():
	Money += 1
	$HBoxContainer/MMoney.text = "$" + str(Money)

func _on_BuyPrice_pressed():
	if Money >= Buy:
		Money -= Buy
		Count += 1
		Buy += 10
		var Upgraded = Base + 5
		if $CanvasLayer/GridContainer/UP1.value == 100:
			$GridContainer/UP1.value = -10
		$CanvasLayer/GridContainer/UP1.value += Base
		$CanvasLayer/GridContainer/UP1/Panel/Upgrade.text = "Upgrades:" + str(Count)
		$CanvasLayer/GridContainer/UP1/BuyPrice.text = "Buy:$" + str(Buy)
		$Timer.wait_time -= 0.1


func _on_Upgrades2_pressed():
	if Money >= Upgrade:
		Money -= Upgrade
		$CanvasLayer2/BuyingUpgrades/Control/Upgrades2.queue_free()
