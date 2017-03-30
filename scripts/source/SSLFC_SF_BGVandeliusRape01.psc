;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_SF_BGVandeliusRape01 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor ActorM = MaleRef.GetActorRef()
Actor ActorF = FemaleRef.GetActorRef()

Actor Au01
Actor Au02
Actor Au03

actor[] sexActors = new actor[2]
sslBaseAnimation[] anims =  SexLab.GetAnimationsByTags(2, "MF,Aggressive", "", true)

if (Audience01)
	Au01 = Audience01.GetActorRef()
	sexActors = new actor[3]
	anims =  SexLab.GetAnimationsByTags(3, "MMF,Aggressive", "", true)
endif
if (Audience02)
	Au02 = Audience02.GetActorRef()
	sexActors = new actor[4]
	anims =  SexLab.GetAnimationsByTags(4, "MMMF")
endif
if (Audience03)
	Au03 = Audience03.GetActorRef()
	sexActors = new actor[5]
	anims =  SexLab.GetAnimationsByTags(5, "MMMMF")
endif

sexActors[0] = ActorF
sexActors[1] = ActorM

if (Audience01)
	sexActors[2] = Au01
endif
if (Audience02)
	sexActors[3] = Au02
endif
if (Audience03)
	sexActors[4] = Au03
endif
		
SexLab.StartSex(sexActors, anims, victim=ActorF)

ActorM.EvaluatePackage()
GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MaleRef  Auto  
ReferenceAlias Property FemaleRef  Auto  

SexLabFramework Property SexLab  Auto  

ReferenceAlias Property Audience01  Auto  

ReferenceAlias Property Audience02  Auto  

ReferenceAlias Property Audience03  Auto  
