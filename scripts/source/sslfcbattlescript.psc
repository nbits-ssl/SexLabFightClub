Scriptname sslfcbattlescript extends Quest  

sslfc_util Property appUtil Auto

Function Quit(ReferenceAlias LoserRef)
	Utility.Wait(5)

	Actor ActorM = MaleFighter.GetActorRef()
	Actor ActorF = FemaleFighter.GetActorRef()
	if (PlayerActor.GetAV("Health") < 10.0)
		PlayerActor.ModAV("Health", 50.0)
	endif
	Announcer.GetActorRef().SetFactionRank(SSLFCTodayBattleCount, 1)
	ActorM.SetFactionRank(SSLFCTodayBattleCount, 1)
	ActorF.SetFactionRank(SSLFCTodayBattleCount, 1)
	
	if (LoserRef == FemaleFighter)
		SSLFCBattleLoopWinner.ForceRefTo(ActorM)
		SSLFCBattleLoopLoser.ForceRefTo(ActorF)
	else
		SSLFCBattleLoopWinner.ForceRefTo(ActorF)
		SSLFCBattleLoopLoser.ForceRefTo(ActorM)
	endif
	Actor ActorWinner = SSLFCBattleLoopWinner.GetActorRef()
	Actor ActorLoser = SSLFCBattleLoopLoser.GetActorRef()
	
	; double check with combat state change
	self.removeBattleSpells(ActorM)
	self.removeBattleSpells(ActorF)
	
	self.changeRelationshipRank(ActorWinner, ActorLoser)
	appUtil.log("change relation.")
	
	ActorM.RemoveFromFaction(SSLFCMaleFaction)
	ActorF.RemoveFromFaction(SSLFCFemaleFaction)
	ActorM.StopCombat()
	ActorF.StopCombat()

	self.addBattleCount(ActorWinner, true)
	self.addBattleCount(ActorLoser, false)
	appUtil.log("add battle count.")
	
	self.payBounty(ActorWinner, true)
	self.payBounty(ActorLoser, false)
	appUtil.log("pay bounty.")
	
	;MaleFighter.Clear()
	;FemaleFighter.Clear()
	
	if (ActorLoser.GetActorBase().GetSex() == 1) ; Female Loser
		appUtil.log("Female losed.")
		ActorWinner.Say(SSLFCBattleLoop2ndRoundStartTopic)
		Utility.Wait(3.0)
		
		sslBaseAnimation[] anims
		anims =  SexLab.GetAnimationsByTags(2, "MF,Aggressive", "", true)
		actor[] sexActors = new actor[2]
		sexActors[0] = ActorLoser
		sexActors[1] = ActorWinner
		
		RegisterForModEvent("HookAnimationEnd_FirstFight", "EndSexEventFirstFight")
		SexLab.StartSex(sexActors, anims, victim=ActorLoser, CenterOn=ActorWinner, hook="FirstFight")
	else
		appUtil.log("Male losed.")
		MaleFighter.Clear()
		FemaleFighter.Clear()
		
		if (ActorF == Game.GetPlayer())
			self.gotoNextStage(true)
		else
			self.gotoNextStage(false)
		endif
	endif
	
	appUtil.log("ArenaBattle End.")
EndFunction

Event EndSexEventFirstFight(int tid, bool HasPlayer)
	;sslThreadController Thread = SexLab.GetController(tid)
	;Actor akActor = Thread.Positions[0]
	appUtil.log("EndSexEvent Hook")
	MaleFighter.Clear()
	FemaleFighter.Clear()
	UnregisterForModEvent("HookAnimationEnd_FirstFight")
	
	self.gotoNextStage(HasPlayer)
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

Function addBattleCount(Actor act, Bool isWinner)
	int rank = act.GetFactionRank(SSLFCBattleCount)
	if (rank && rank < 100)
		act.SetFactionRank(SSLFCBattleCount, rank + 1)
	else
		act.SetFactionRank(SSLFCBattleCount, 1)
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

Function changeRelationshipRank(Actor actwinner, Actor actloser)
	float percentage
	int rank = actwinner.GetRelationshipRank(actloser)
	
	if (rank)
		if (rank >= 3 || rank <= -2)
			return
		endif
	else
		actwinner.SetRelationshipRank(actloser, 0)
		rank = 0
	endif

	percentage = actwinner.GetAVPercentage("Health")
	appUtil.log("Winner Health: " + percentage)

	appUtil.log("base relationshiprank: " + rank)
	if (percentage > 0.85)
		actwinner.SetRelationshipRank(actloser, rank - 1)
		appUtil.log("relationshiprank: DOWN")
	elseif (percentage < 0.7)
		actwinner.SetRelationshipRank(actloser, rank + 1)
		appUtil.log("relationshiprank: UP")
	else
		appUtil.log("relationshiprank: NO CHANGE")
	endif
EndFunction

Function removeBattleSpells(Actor act)
	act.RemoveSpell(SSLFCEbonyflesh)
	act.RemoveSpell(SSLFCSlowAbility)
EndFunction

ReferenceAlias Property MaleFighter  Auto  
ReferenceAlias Property FemaleFighter  Auto  
ReferenceAlias Property SSLFCBattleLoopWinner  Auto  

SexLabFramework Property SexLab  Auto  

Quest Property SSLFCMainQuest  Auto  
Quest Property SSLFCBattleLoop  Auto  
MiscObject Property Gold001  Auto  
Faction Property SSLFCExtasyFaction  Auto  

Actor Property PlayerActor  Auto  
SPELL Property SSLFCEbonyflesh  Auto  
SPELL Property SSLFCSlowAbility  Auto  

Topic Property SSLFCBattleLoop2ndRoundStartTopic  Auto  

ReferenceAlias Property Announcer  Auto  
Faction Property SSLFCTodayBattleCount  Auto  

Faction Property SSLFCMaleFaction  Auto  
Faction Property SSLFCFemaleFaction  Auto  

Faction Property SSLFCBattleCount  Auto  

Quest Property SSLFCBGBattleLoopAfter01  Auto  

ReferenceAlias Property SSLFCBattleLoopLoser  Auto  
