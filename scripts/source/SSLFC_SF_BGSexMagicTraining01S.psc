;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SSLFC_SF_BGSexMagicTraining01S Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SSLFCTrainingGate.SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Female.GetActorRef().StopCombat()
Trainer.GetActorRef().StopCombat()
Audience01.GetActorRef().StopCombat()
Audience02.GetActorRef().StopCombat()
Audience03.GetActorRef().StopCombat()

GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property female  Auto  

ReferenceAlias Property Trainer  Auto  

ReferenceAlias Property Audience01  Auto  

ReferenceAlias Property Audience02  Auto  

ReferenceAlias Property Audience03  Auto  

Door Property TrainingGate  Auto  

ObjectReference Property SSLFCTrainingGate  Auto  
