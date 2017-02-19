;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname SSLFC_QF_SSLFCMain Extends Quest Hidden

;BEGIN ALIAS PROPERTY manager
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_manager Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Announcer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Announcer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY 1stMale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_1stMale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RoomGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RoomGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ManagerGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ManagerGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY 1stFemale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_1stFemale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ZooKeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ZooKeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerBed Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
self.SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
Alias_Announcer.GetRef().MoveTo(GrislodMarker10)
Alias_1stFemale.GetRef().MoveTo(ArenaFemaleMarker)
Alias_ZooKeeper.GetRef().MoveTo(TourMarkerElehelenIntro)

if (!SSLFCDialog.isRunning())
	SSLFCDialog.Start()
endif
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
self.SetActive()
self.SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE sslfcscript
Quest __temp = self as Quest
sslfcscript kmyQuest = __temp as sslfcscript
;END AUTOCAST
;BEGIN CODE
self.SetObjectiveCompleted(20)
Utility.Wait(2)
SSLFCRingDoor.Lock()
SSLFCArenaNavCut.Enable()
SSLFCArenaInvisibleWall.Enable()
kmyQuest.StartArenaBattle(Alias_1stMale, Alias_1stFemale)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
self.SetObjectiveCompleted(40)
Actor actpl = Alias_Player.GetActorRef()
actpl.AddItem(SSLFCCollar)
actpl.EquipItem(SSLFCCollar)
self.SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
self.SetObjectiveCompleted(45)
SSLFCMainTour.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SSLFCArenaNavCut.Disable()
SSLFCArenaInvisibleWall.Disable()
SSLFCRingDoor.Lock(false)
SSLFCRingDoor.SetOpen()
self.SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SSLFCMainTour  Auto  

ObjectReference Property SSLFCRingDoor  Auto  

ObjectReference Property SSLFCArenaInvisibleWall  Auto  

ObjectReference Property SSLFCArenaNavCut  Auto  

ObjectReference Property GrislodMarker10  Auto  

Armor Property SSLFCCollar  Auto  

ObjectReference Property TourMarkerElehelenIntro  Auto  

ObjectReference Property ArenaFemaleMarker  Auto  

Quest Property SSLFCDialog  Auto  
