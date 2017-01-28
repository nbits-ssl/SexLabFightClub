;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname SSLFC_QF_SSLFCBattleLoop Extends Quest Hidden

;BEGIN ALIAS PROPERTY FemaleFighter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FemaleFighter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MaleFighter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MaleFighter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Announcer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Announcer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KeyManager
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeyManager Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SSLFCBattleLoopEnter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
Utility.Wait(2)
kmyQuest.StartArenaBattleLoop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
SSLFCRingDoor.Lock()
kmyQuest.StartArenaBattle(Alias_MaleFighter, Alias_FemaleFighter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SSLFCRingDoor.Lock(false)
SSLFCRingDoor.SetOpen()
SSLFCBattleLoopExit.Start()
Alias_FemaleFighter.TryToEvaluatePackage()
Alias_MaleFighter.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SSLFCBattleLoopEnter  Auto  

Scene Property SSLFCBattleLoopExit  Auto  

ObjectReference Property SSLFCRingDoor  Auto  
