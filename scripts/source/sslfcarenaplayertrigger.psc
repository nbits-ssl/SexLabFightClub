Scriptname sslfcarenaplayertrigger extends ObjectReference  

Event OnTriggerEnter(ObjectReference akTriggerRef)
	if (akTriggerRef == Game.GetPlayer() && SSLFCBattleLoop.GetStage() == 11)
		SSLFCBattleLoop.SetObjectiveCompleted(11)
		SSLFCBattleLoop.SetStage(12)
	endif
EndEvent

Quest Property SSLFCBattleLoop  Auto  
