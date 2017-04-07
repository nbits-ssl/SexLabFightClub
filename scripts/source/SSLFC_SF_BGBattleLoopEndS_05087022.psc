;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_SF_BGBattleLoopEndS_05087022 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
sslBaseAnimation[] anims
anims =  SexLab.GetAnimationsByTags(2, "MF", "Aggressive", true)

Actor ActorF01 = Loser01.GetActorRef()

if (ActorF01)
	Actor ActorM01 = Male01.GetActorRef()

	actor[] sexActors1 = new actor[2]
	sexActors1[0] = ActorF01
	sexActors1[1] = ActorM01
	SexLab.StartSex(sexActors1, anims, victim=ActorF01)
endif

Actor ActorF02 = Loser02.GetActorRef()

if (ActorF02)
	Actor ActorM02 = Male02.GetActorRef()

	actor[] sexActors2 = new actor[2]
	sexActors2[0] = ActorF02
	sexActors2[1] = ActorM02
	SexLab.StartSex(sexActors2, anims, victim=ActorF02)
endif

Actor ActorF03 = Loser03.GetActorRef()

if (ActorF03)
	Actor ActorM03 = Male03.GetActorRef()

	actor[] sexActors3 = new actor[2]
	sexActors3[0] = ActorF03
	sexActors3[1] = ActorM03
	SexLab.StartSex(sexActors3, anims, victim=ActorF03)
endif

GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SexLabFramework Property SexLab  Auto  
ReferenceAlias Property Loser01  Auto  

ReferenceAlias Property Loser02  Auto  

ReferenceAlias Property Loser03  Auto  

ReferenceAlias Property Male01  Auto  

ReferenceAlias Property Male02  Auto  

ReferenceAlias Property Male03  Auto  
