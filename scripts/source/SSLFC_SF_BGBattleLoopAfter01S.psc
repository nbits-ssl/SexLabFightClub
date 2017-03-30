;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_SF_BGBattleLoopAfter01S Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor ActorM = Alias_Male.GetActorRef()
Actor ActorF = Alias_Female.GetActorRef()

sslBaseAnimation[] anims
anims =  SexLab.GetAnimationsByTags(2, "MF,Oral,Kneeling", "Cunnilingus", true)
actor[] sexActors = new actor[2]
sexActors[0] = ActorF
sexActors[1] = ActorM
		
SexLab.StartSex(sexActors, anims, victim=ActorF, CenterOn=ActorM)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SexLabFramework Property SexLab  Auto  
ReferenceAlias Property Alias_male  Auto  

ReferenceAlias Property Alias_female  Auto  
