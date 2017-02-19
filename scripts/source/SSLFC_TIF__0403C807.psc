;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_TIF__0403C807 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor actpl = Game.GetPlayer()
actpl.AddItem(SelectedBoots)
actpl.AddItem(SelectedCuirass)
actpl.AddItem(SelectedWeapon)

GetOwningQuest().SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property SelectedWeapon  Auto  

Armor Property SelectedBoots  Auto  

Armor Property SelectedCuirass  Auto  
