;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SSLFC_QF_CQRigna01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY opener
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_opener Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Closer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Closer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
self.SetObjectiveCompleted(0)
Actor Player = Alias_Player.GetActorRef()
;Player.AddItem(FeeLItem, FeeItemNum)
kmyQuest.SetRelationDown(Alias_Player, Alias_Opener)
self.Stop()
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
self.SetObjectiveCompleted(0)
Actor Player = Alias_Player.GetActorRef()
Player.AddItem(FeeLItem, FeeItemNum)
kmyQuest.SetRelationUp(Alias_Player, Alias_Opener)
self.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
self.SetObjectiveDisplayed(0)

Actor Player = Alias_Player.GetActorRef()
int select = Utility.RandomInt()
if (select > 50)
	Player.AddItem(TargetItems[0], TargetItemNum)
else
	Player.AddItem(TargetItems[1], TargetItemNum)
endif

Actor Opener = Alias_Opener.GetActorRef()
Opener.SetFactionRank(SSLFCTodayWorkCount, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property TargetItem  Auto  

MiscObject Property FeeItem  Auto  


Int Property TargetItemNum  Auto  

Int Property FeeItemNum  Auto  

LeveledItem Property FeeLItem  Auto  

Faction Property SSLFCTodayWorkCount  Auto  

Potion[] Property TargetItems  Auto  
