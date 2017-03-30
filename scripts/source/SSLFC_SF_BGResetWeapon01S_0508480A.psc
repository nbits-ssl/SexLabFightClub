;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_SF_BGResetWeapon01S_0508480A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor ActorM = MaleRef.GetActorRef()
Actor ActorF = FemaleRef.GetActorRef()
ActorBase ActorFBase = ActorF.GetActorBase()

if (ActorF.GetItemCount(Gold001) < 250)
	sslBaseAnimation[] anims
	anims =  SexLab.GetAnimationsByTags(2, "MF", "", true)
	actor[] sexActors = new actor[2]
	sexActors[0] = ActorF
	sexActors[1] = ActorM
		
	SexLab.StartSex(sexActors, anims)
else
	ActorF.RemoveItem(Gold001, 250)
	if (ActorF.IsInFaction(FCNPCGuestFaction))
		ActorF.AddItem(SteelSword, 1)
	elseif (ActorFBase.GetVoiceType() == FemaleChild)
		ActorF.AddItem(SteelDagger, 1)
	elseif (ActorFBase.GetVoiceType() == FemaleEvenToned)
		ActorF.AddItem(SteelMace, 1)
	else
		ActorF.AddItem(IronSword, 1)
	endif
endif

GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SexLabFramework Property SexLab  Auto 
ReferenceAlias Property MaleRef  Auto  

ReferenceAlias Property FemaleRef  Auto  

MiscObject Property Gold001  Auto  

Faction Property FCNGuestFaction  Auto  

Faction Property FCNPCGuestFaction  Auto  

VoiceType Property FemaleChild  Auto  

VoiceType Property FemaleEvenToned  Auto  

WEAPON Property SteelDagger  Auto  

WEAPON Property SteelMace  Auto  

WEAPON Property SteelSword  Auto  

WEAPON Property IronSword  Auto  
