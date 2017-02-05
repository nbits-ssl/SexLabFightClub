Scriptname sslfcarenafighter extends ReferenceAlias  

Event OnEnterBleedout()
	BattleScript.Quit(self)
EndEvent

Event OnCombatStateChanged(Actor akActor, int aeCombatState)
	Actor selfActor = self.GetActorRef()
	if (aeCombatState == 0)
		selfActor.RemoveSpell(SSLFCEbonyflesh)
	elseif (aeCombatState == 1)
		selfActor.AddSpell(SSLFCEbonyflesh)
	endif
EndEvent

Quest Property SSLFCBattle  Auto
sslfcbattlescript Property BattleScript Auto
SPELL Property SSLFCEbonyflesh  Auto  