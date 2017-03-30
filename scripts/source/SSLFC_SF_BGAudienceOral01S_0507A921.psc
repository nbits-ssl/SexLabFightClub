;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_SF_BGAudienceOral01S_0507A921 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor ActorM = MaleRef.GetActorRef()
Actor ActorF = FemaleRef.GetActorRef()

sslBaseAnimation[] anims
anims =  SexLab.GetAnimationsByTags(2, "MF,Oral,Kneeling", "Cunnilingus", true)
actor[] sexActors = new actor[2]
sexActors[0] = ActorF
sexActors[1] = ActorM
		
SexLab.StartSex(sexActors, anims)

GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SexLabFramework Property SexLab  Auto  
ReferenceAlias Property MaleRef  Auto  

ReferenceAlias Property FemaleRef  Auto  
