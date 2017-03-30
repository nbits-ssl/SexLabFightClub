;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname SSLFC_QF_SSLFCBattleLoop Extends Quest Hidden

;BEGIN ALIAS PROPERTY FemaleFighter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FemaleFighter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArenaMaleWaitMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArenaMaleWaitMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArenaFemaleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArenaFemaleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY winner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_winner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MaleFighter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MaleFighter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Loser
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Loser Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KeyManager
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeyManager Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Announcer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Announcer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
Utility.Wait(1)
float Time = Utility.GetCurrentGameTime()
Time -= Math.Floor(Time)
Time *= 24
int hour = (Time as Int)

if (hour < 21 && hour > 11)
	SSLFCBGAudienceOral01.Start()
	SSLFCBGSexMagicTraining01.Start()
	kmyQuest.StartArenaBattleLoop()
else
	self.SetStage(101)
endif
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
kmyQuest.StartArenaBattle(Alias_MaleFighter, Alias_FemaleFighter)
SSLFCRingDoor.SetOpen(false)
SSLFCRingDoor.Lock()
SSLFCArenaNavCut.Enable()
SSLFCArenaInvisibleWall.Enable()

SSLFCBGResetWeapon01.Start()

if (AfterEventWinner.GetRef() && AfterEventWinner != Alias_MaleFighter)
	if (AfterEventLoser.GetRef() && AfterEventLoser != Alias_FemaleFighter)
		SSLFCBGBattleLoopAfter01.SetStage(1)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Alias_Player.GetActorRef()
if (Player.IsInFaction(SSLFCReserveNextBattle) || Utility.RandomInt() < 50)
	Player.RemoveFromFaction(SSLFCReserveNextBattle)
	self.SetStage(11)
else
	SSLFCBattleLoopEnter.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
SSLFCBattleLoopEnterWithPlayer.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
self.SetActive()
self.SetObjectiveDisplayed(11)
SSLFCBattleLoopWaitForPlayer.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SSLFCArenaNavCut.Disable()
SSLFCArenaInvisibleWall.Disable()
SSLFCRingDoor.Lock(false)
SSLFCRingDoor.SetOpen()

if (SSLFCBGBattleLoopAfter01.IsRunning())
	SSLFCBGBattleLoopAfter01.Reset()
endif
SSLFCBGBattleLoopAfter01.Start()

Actor ActorM = Alias_MaleFighter.GetActorRef()
if (ActorM == Alias_Winner.GetActorRef())
	AfterEventWinner.ForceRefTo(ActorM)
	AfterEventLoser.ForceRefTo(Alias_FemaleFighter.GetActorRef())
else
	AfterEventWinner.Clear()
	AfterEventLoser.Clear()
endif

SSLFCBattleLoopExit.Start()
Alias_FemaleFighter.TryToEvaluatePackage()
Alias_MaleFighter.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SSLFCArenaNavCut.Disable()
SSLFCArenaInvisibleWall.Disable()
SSLFCRingDoor.Lock(false)
SSLFCRingDoor.SetOpen()
SSLFCBattleLoopExitWithPlayer.Start()
Alias_MaleFighter.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartArenaBattle(Alias_MaleFighter, Alias_Player)
SSLFCRingDoor.SetOpen(false)
SSLFCRingDoor.Lock()
SSLFCArenaNavCut.Enable()
SSLFCArenaInvisibleWall.Enable()

if (AfterEventWinner && AfterEventWinner != Alias_MaleFighter)
	if (AfterEventLoser && AfterEventLoser != Alias_FemaleFighter)
		SSLFCBGBattleLoopAfter01.SetStage(1)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SSLFCBattleLoopEnter  Auto  

Scene Property SSLFCBattleLoopExit  Auto  

ObjectReference Property SSLFCRingDoor  Auto  

Scene Property SSLFCBattleLoopEnterWithPlayer  Auto  

Scene Property SSLFCBattleLoopExitWithPlayer  Auto  

ObjectReference Property SSLFCArenaNavCut  Auto  

ObjectReference Property SSLFCArenaInvisibleWall  Auto  

Scene Property SSLFCBattleLoopEnd  Auto  

Scene Property SSLFCBattleLoopWaitForPlayer  Auto  

Faction Property SSLFCReserveNextBattle  Auto  

ReferenceAlias Property AfterEventWinner  Auto  

ReferenceAlias Property AfterEventLoser  Auto  

Quest Property SSLFCBGBattleLoopAfter01  Auto  

Quest Property SSLFCBGAudienceOral01  Auto  

Quest Property SSLFCBGSexMagicTraining01  Auto  

Quest Property SSLFCBGResetWeapon01  Auto  
