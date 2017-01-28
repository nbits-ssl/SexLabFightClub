Scriptname sslfcbattlescript extends Quest  

sslfc_util Property appUtil Auto

Function Quit(ReferenceAlias LoserRef)
	Utility.Wait(5)
	
	Actor ActorM = MaleFighter.GetActorRef()
	Actor ActorF = FemaleFighter.GetActorRef()
	
	if (LoserRef == FemaleFighter)
		appUtil.log("Female losed.")
		sslBaseAnimation[] anims
		anims =  SexLab.GetAnimationsByTags(2, "MF", "aggressive")
		actor[] sexActors = new actor[2]
		sexActors[0] = ActorF
		sexActors[1] = ActorM
		
		RegisterForModEvent("HookAnimationEnd_FirstFight", "EndSexEventFirstFight")
		SexLab.StartSex(sexActors, anims, victim=ActorF, hook="FirstFight")
	endif
	
	ActorM.StopCombat()
	ActorF.StopCombat()
	
	MaleFighter.Clear()
	FemaleFighter.Clear()
	
	if (LoserRef == MaleFighter)
		appUtil.log("Male losed.")
		if (SSLFCMainQuest.IsRunning() && SSLFCMainQuest.GetStage() < 40)
			SSLFCMainQuest.SetStage(40)
		else
			SSLFCBattleLoop.SetStage(30)
		endif
	endif
	
	appUtil.log("ArenaBattle End.")
EndFunction

Event EndSexEventFirstFight(int tid, bool HasPlayer)
	appUtil.log("EndSexEvent Hook")
	sslThreadController Thread = SexLab.GetController(tid)
	Actor akActor = Thread.Positions[0]
	
	if (SSLFCMainQuest.IsRunning() && SSLFCMainQuest.GetStage() < 40)
		SSLFCMainQuest.SetStage(40)
	else
		SSLFCBattleLoop.SetStage(30)
	endif
	
	UnregisterForModEvent("HookAnimationEnd_FirstFight")
EndEvent

ReferenceAlias Property MaleFighter  Auto  
ReferenceAlias Property FemaleFighter  Auto  
SexLabFramework Property SexLab  Auto  
Quest Property SSLFCMainQuest  Auto  
Quest Property SSLFCBattleLoop  Auto  
