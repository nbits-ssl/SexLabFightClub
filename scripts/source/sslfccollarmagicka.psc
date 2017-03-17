Scriptname sslfccollarmagicka extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	OriginalMagicka = akCaster.GetAV("Magicka")
	OrigfBarterMax = Game.GetGameSettingFloat("fBarterMax")
	OrigfBarterMin = Game.GetGameSettingFloat("fBarterMin")

	akCaster.SetAV("Magicka", 1.0)
	Game.SetGameSettingFloat("fBarterMax", 7.5)
	Game.SetGameSettingFloat("fBarterMin", 4.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.SetAV("Magicka", OriginalMagicka)
	Game.SetGameSettingFloat("fBarterMax", OrigfBarterMax)
	Game.SetGameSettingFloat("fBarterMin", OrigfBarterMin)
EndEvent

Float Property OriginalMagicka  Auto  
Float Property OrigfBarterMin  Auto  
Float Property OrigfBarterMax  Auto  
