Scriptname sslfcscript extends Quest

sslfc_util Property appUtil Auto

Function StartArenaBattleLoop()
	appUtil.log("ArenaBattleLoop Started.")
	
	if (!SSLFCBattleLoop.IsRunning())
		SSLFCBattleLoop.Start()
	endif
	
	int queststage = SSLFCBattleLoop.GetStage()
	if (queststage == 0 || queststage == 100)
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
	
	appUtil.log("Male Fighter: " + MaleFighter.GetActorRef().GetActorBase().GetName())
	appUtil.log("Female Fighter: " + FemaleFighter.GetActorRef().GetActorBase().GetName())
EndFunction

Quest Property SSLFCBattle  Auto  
Quest Property SSLFCBattleLoop  Auto  

ReferenceAlias Property FirstMale  Auto  
ReferenceAlias Property FirstFemale  Auto  
ReferenceAlias Property MaleFighter  Auto
ReferenceAlias Property FemaleFighter  Auto  
