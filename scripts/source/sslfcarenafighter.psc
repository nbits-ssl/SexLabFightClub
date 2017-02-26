Scriptname sslfcarenafighter extends ReferenceAlias  

Event OnEnterBleedout()
	BattleScript.Quit(self)
EndEvent

Event OnCombatStateChanged(Actor akActor, int aeCombatState)
	Actor selfActor = self.GetActorRef()
	if (aeCombatState == 0)
		selfActor.RemoveSpell(SSLFCEbonyflesh)
		; selfActor.RemoveSpell(SSLFCSlowAbility)
	elseif (aeCombatState == 1)
		selfActor.AddSpell(SSLFCEbonyflesh)
		Armor selfarmor = selfActor.GetWornForm(0x00000004) as Armor

		; dispell slow ability can't back normal speeemulti
		; if (!selfarmor)
		;	selfActor.AddSpell(SSLFCSlowAbility)
		; endif
	endif
EndEvent

Quest Property SSLFCBattle  Auto
sslfcbattlescript Property BattleScript Auto
SPELL Property SSLFCEbonyflesh  Auto  
SPELL Property SSLFCSlowAbility  Auto  

;SPELL Property SSLFCSlow  Auto  
