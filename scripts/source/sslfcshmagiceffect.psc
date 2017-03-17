Scriptname sslfcshmagiceffect extends ActiveMagicEffect  

Event OnEffectStart(actor target, actor caster)
	int slapt = target.GetFactionRank(ArousalFaction)
	debug.trace("================= slapt " + slapt)
	
	if (slapt >= 100)
		Weapon tw = target.GetEquippedWeapon()
		if (tw)
			target.DropObject(tw, 1)
		endif
		target.SetFactionRank(ArousalFaction, 75)
		debug.sendAnimationEvent(target, "BleedOutStart")
		Utility.wait(2.5)
		;caster.PushActorAway(target, 1.0)

		int exfpt = target.GetFactionRank(SSLFCExtasyFaction) + 1
		target.SetFactionRank(SSLFCExtasyFaction, exfpt)
		debug.trace("================= exfpt " + exfpt)
		
		if (exfpt >= 5)
			target.ModAV("Health", -20.0)
		endif
	else
		target.SetFactionRank(ArousalFaction, slapt + 10)
	endif
EndEvent

;SexLabFramework Property SexLab  Auto
Faction Property ArousalFaction  Auto  
Faction Property SSLFCExtasyFaction  Auto  

Topic Property SayTopic  Auto  
