;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_PF_BattleExitM_0502DA1A Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
if (akActor.IsInFaction(SSLFCAudienceBackupFaction))
	akActor.UnEquipItem(EbonyMace)
	akActor.UnEquipItem(ArmorEbonyBoots)
	akActor.UnEquipItem(ArmorEbonyCuirass)
	akActor.UnEquipItem(ArmorEbonyGauntlets)

	akActor.RemoveItem(EbonyMace, 1)
	akActor.RemoveItem(ArmorEbonyBoots, 1)
	akActor.RemoveItem(ArmorEbonyCuirass, 1)
	akActor.RemoveItem(ArmorEbonyGauntlets, 1)

	akActor.AddToFaction(SSLFCAudienceFaction)
	akActor.RemoveFromFaction(SSLFCAudienceBackupFaction)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property ArmorEbonyBoots  Auto  

Armor Property ArmorEbonyCuirass  Auto  

Armor Property ArmorEbonyGauntlets  Auto  

WEAPON Property EbonyMace  Auto  

Faction Property SSLFCAudienceFaction  Auto  

Faction Property SSLFCAudienceBackupFaction  Auto  
