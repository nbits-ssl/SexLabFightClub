Scriptname sslfcarenafemale extends ReferenceAlias

Form PreSource = None
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

;	debug.trace("==================onhit enter")

if akAggressor == None || akProjectile || PreSource ==  akSource
;	debug.trace("==================not if")
	return
endif

GotoState("Busy")
	PreSource = akSource
	
;	debug.trace("==================onhit")
	if (abPowerAttack && !abHitBlocked)
;		debug.trace("==================onhit success")
		Actor selfact = self.GetActorRef()
		Armor selfarmor = selfact.GetWornForm(0x00000004) as Armor
		Int chance = Utility.RandomInt()
		if (selfarmor && chance < 20)
			selfact.UnequipItemSlot(32)
			selfact.RemoveItem(selfarmor)
			; dispell slow ability can't back normal speeemulti
			; selfact.AddSpell(SSLFCSlowAbility)
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
