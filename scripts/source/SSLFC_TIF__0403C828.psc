;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_TIF__0403C828 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor actpl = Game.GetPlayer()
actpl.AddItem(ArmorLeatherBoots)
actpl.AddItem(ArmorLeatherCuirass)
actpl.AddItem(ArmorLeatherGauntlets)

Quest nquest = GetOwningQuest()
if (nquest.GetStage() == 63)
	nquest.SetStage(64)
else
	nquest.SetStage(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property ArmorLeatherBoots  Auto  

Armor Property ArmorLeatherCuirass  Auto  

Armor Property ArmorLeatherGauntlets  Auto  
