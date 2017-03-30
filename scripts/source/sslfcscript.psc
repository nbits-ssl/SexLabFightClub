Scriptname sslfcscript extends Quest

sslfc_util Property appUtil Auto

Function ReadyArenaBattleLoop()
	if (!SSLFCBattleLoop.IsRunning())
		SSLFCBattleLoop.Start()
	endif
	
	if (SSLFCBattleLoop.GetStage() == 101)
		SSLFCBattleLoop.Reset()
		SSLFCBattleLoop.SetStage(0)
	endif
EndFunction

Function StartArenaBattleLoop()
	appUtil.log("ArenaBattleLoop Started.")
	
	if (SSLFCBattleLoop.IsRunning() == false)
		SSLFCBattleLoop.Start()
	endif
	if (SSLFCBattleLoop.IsRunning())
		appUtil.log("BattleLoop quest: running")
	else
		appUtil.log("BattleLoop quest: not running cause some fatal reason")
	endif
	
	int queststage = SSLFCBattleLoop.GetStage()
	appUtil.log("BattleLoop quest stage: " + queststage)
	if (queststage == 0 || queststage == 100 || queststage == 101)
		SSLFCBattleLoop.Reset()
		Utility.Wait(2)
		SSLFCBattleLoop.Start()
		SSLFCBattleLoop.SetStage(10)
	endif
EndFunction

Function StartArenaBattle(ReferenceAlias MaleRef, ReferenceAlias FemaleRef)
	appUtil.log("ArenaBattle Started.")
	
	if (!SSLFCBattle.IsRunning())
		SSLFCBattle.Start()
	endif
	
	MaleFighter.ForceRefTo(MaleRef.GetActorRef())
	FemaleFighter.ForceRefTo(FemaleRef.GetActorRef())
	FemaleRef.GetActorRef().SetFactionRank(SSLFCExtasyFaction, 0)
	
	appUtil.log("Male Fighter: " + MaleFighter.GetActorRef().GetActorBase().GetName())
	appUtil.log("Female Fighter: " + FemaleFighter.GetActorRef().GetActorBase().GetName())
EndFunction

Function StartCharacterQuest(Quest CQ)
	CQ.Reset()
	Utility.Wait(1)
	CQ.Start()
EndFunction

Function SetRelationUp(ReferenceAlias FromActor, ReferenceAlias ToActor)
	Actor fromact = FromActor.GetActorRef()
	Actor toact = ToActor.GetActorRef()
	int rank = fromact.GetRelationshipRank(toact)
	if (rank)
		if (rank >= 3 || rank <= -2)
			return
		else
			fromact.SetRelationshipRank(toact, rank + 1)
		endif
	else
		fromact.SetRelationshipRank(toact, 1)
	endif
EndFunction

Function SetRelationDown(ReferenceAlias FromActor, ReferenceAlias ToActor)
	Actor fromact = FromActor.GetActorRef()
	Actor toact = ToActor.GetActorRef()
	int rank = fromact.GetRelationshipRank(toact)
	if (rank)
		if (rank >= 3 || rank <= -2)
			return
		else
			fromact.SetRelationshipRank(toact, rank - 1)
		endif
	else
		fromact.SetRelationshipRank(toact, -1)
	endif
EndFunction

Quest Property SSLFCBattle  Auto  
Quest Property SSLFCBattleLoop  Auto  

ReferenceAlias Property FirstMale  Auto  
ReferenceAlias Property FirstFemale  Auto

ReferenceAlias Property MaleFighter  Auto
ReferenceAlias Property FemaleFighter  Auto  

Faction Property SSLFCExtasyFaction  Auto  
