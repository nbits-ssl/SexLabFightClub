Scriptname SSLFC_CQPlayer_ItemGet extends ReferenceAlias  


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if (CQ.GetStage() == 0)
		if (akSourceContainer == TargetContainer)
			if (akBaseItem == TargetMiscObject || akBaseItem == TargetPotion)
				CQ.SetStage(1)
			endif
		endif
	endif
endEvent

Quest Property CQ  Auto  
MiscObject Property TargetMiscObject  Auto  
Potion Property TargetPotion  Auto  
ObjectReference Property TargetContainer  Auto  
