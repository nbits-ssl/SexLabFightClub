;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_TIF__04043EFC Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Quest SSLFCMain = GetOwningQuest()
if (SSLFCMain.GetStage() >= 60)
	SSLFCMain.SetStage(100)
	SSLFCMain.SetObjectiveCompleted(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
