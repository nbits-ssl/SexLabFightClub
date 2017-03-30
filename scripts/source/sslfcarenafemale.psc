Scriptname sslfcarenafemale extends ReferenceAlias

Form PreSource = None
Int SelfSex
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

;	debug.trace("==================onhit enter")

if (SelfSex && SelfSex != 1) || akAggressor == None || akProjectile || PreSource ==  akSource
;	debug.trace("==================not if")
	return
endif

GotoState("Busy")
	PreSource = akSource
	
;	debug.trace("==================onhit")
	if (abPowerAttack && !abHitBlocked)
;		debug.trace("==================onhit success")
		Actor selfact = self.GetActorRef()
		if (!SelfSex)
			SelfSex = selfact.GetActorBase().GetSex()
			if (SelfSex != 1)
				GotoState("")
				return
			endif
		endif
		Armor selfarmor = selfact.GetWornForm(0x00000004) as Armor
		Int chance = Utility.RandomInt()
		if (selfarmor && chance < 33)
		; if (selfarmor)
			selfact.UnequipItemSlot(32)
			selfact.RemoveItem(selfarmor)
			selfact.AddSpell(SSLFCSlowAbility)
			; selfact.AddItem(SSLFCShame, 1)
			if (selfact == Player)
				SSLFCPlayersChest.AddItem(selfarmor, 1)
			endif
		endif
	endif
	
	Utility.Wait(0.5)
	PreSource = None
	GotoState("")
EndEvent

State Busy
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;		debug.trace("==================busy")
		; do nothing
	EndEvent
EndState

SPELL Property SSLFCSlowAbility  Auto  

MiscObject Property SSLFCShame  Auto  

ObjectReference Property SSLFCPlayersChest Auto

Actor Property Player  Auto  
