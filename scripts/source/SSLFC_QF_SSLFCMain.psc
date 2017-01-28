;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SSLFC_QF_SSLFCMain Extends Quest Hidden

;BEGIN ALIAS PROPERTY manager
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_manager Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ManagerGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ManagerGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ZooKeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ZooKeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY 1stMale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_1stMale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Announcer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Announcer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY 1stFemale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_1stFemale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SSLFCMainTour.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
Utility.Wait(2)
kmyQuest.StartArenaBattle(Alias_1stMale, Alias_1stFemale)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SSLFCMainTour  Auto  
