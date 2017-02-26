Scriptname sslfcbattlescript extends Quest  

sslfc_util Property appUtil Auto

Function Quit(ReferenceAlias LoserRef)
	Utility.Wait(2.5)
	bool needsexlab = false
	
	Actor ActorM = MaleFighter.GetActorRef()
	Actor ActorF = FemaleFighter.GetActorRef()
	if (ActorF.GetAV("Health") < 10.0)
		ActorF.ModAV("Health", 10.0)
	endif

	ActorM.StopCombat()
	ActorF.StopCombat()

	if (LoserRef == FemaleFighter)
		needsexlab = true
	endif
	
	self.payBounty(ActorM, needsexlab)
	self.payBounty(ActorF, !needsexlab)
	appUtil.log("pay bounty.")
	
	MaleFighter.Clear()
	FemaleFighter.Clear()
	
	if (needsexlab)
		appUtil.log("Female losed.")
		sslBaseAnimation[] anims
		anims =  SexLab.GetAnimationsByTags(2, "MF,Aggressive", "", true)
		actor[] sexActors = new actor[2]
		sexActors[0] = ActorF
		sexActors[1] = ActorM
		
		RegisterForModEvent("HookAnimationEnd_FirstFight", "EndSexEventFirstFight")
		SexLab.StartSex(sexActors, anims, victim=ActorF, hook="FirstFight")
	else
		appUtil.log("Male losed.")
		
		if (ActorF == Game.GetPlayer())
			self.gotoNextStage(true)
		else
			self.gotoNextStage(false)
		endif
	endif
	
	appUtil.log("ArenaBattle End.")
EndFunction

Event EndSexEventFirstFight(int tid, bool HasPlayer)
	appUtil.log("EndSexEvent Hook")
	sslThreadController Thread = SexLab.GetController(tid)
	Actor akActor = Thread.Positions[0]
	
	self.gotoNextStage(HasPlayer)
	
	UnregisterForModEvent("HookAnimationEnd_FirstFight")
EndEvent

; ugly goto function
Function gotoNextStage(bool HasPlayer)
	if (SSLFCMainQuest.IsRunning() && SSLFCMainQuest.GetStage() < 40)
		SSLFCMainQuest.SetStage(40)
	elseif (HasPlayer)
		SSLFCBattleLoop.SetStage(31)
	else
		SSLFCBattleLoop.SetStage(30)
	endif
EndFunction

Function payBounty(Actor act, Bool isWinner)
	ActorBase actbase = act.GetActorBase()
	int actsex = actBase.GetSex()
	if (actsex == 0)
		act.AddItem(Gold001, 25)
		if (isWinner)
			act.AddItem(Gold001, 100)
		endif
	elseif (actsex == 1)
		act.AddItem(Gold001, 50)
		if (isWinner)
			act.AddItem(Gold001, 200)
		endif
	endif
EndFunction

ReferenceAlias Property MaleFighter  Auto  
ReferenceAlias Property FemaleFighter  Auto  
ReferenceAlias Property SSLFCBattleLoopWinner  Auto  
SexLabFramework Property SexLab  Auto  
Quest Property SSLFCMainQuest  Auto  
Quest Property SSLFCBattleLoop  Auto  
MiscObject Property Gold001  Auto  
Faction Property SSLFCExtasyFaction  Auto  
