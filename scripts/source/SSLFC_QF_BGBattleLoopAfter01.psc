;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SSLFC_QF_BGBattleLoopAfter01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY male
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_male Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY female
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_female Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SSLFCBGBattleLoopAfter01S.Start()
self.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SSLFCBGBattleLoopAfter01S  Auto  

SexLabFramework Property SexLab  Auto  
