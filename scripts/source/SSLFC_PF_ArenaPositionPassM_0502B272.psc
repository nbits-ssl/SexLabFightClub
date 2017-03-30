;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSLFC_PF_ArenaPositionPassM_0502B272 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
if (akActor.IsInFaction(SSLFCAudienceFaction))
	akActor.AddItem(EbonyMace, 1)
	akActor.AddItem(ArmorEbonyBoots, 1)
	akActor.AddItem(ArmorEbonyCuirass, 1)
	akActor.AddItem(ArmorEbonyGauntlets, 1)

	akActor.EquipItem(EbonyMace)
	akActor.EquipItem(ArmorEbonyBoots)
	akActor.EquipItem(ArmorEbonyCuirass)
	akActor.EquipItem(ArmorEbonyGauntlets)

	akActor.AddToFaction(SSLFCAudienceBackupFaction)
	akActor.RemoveFromFaction(SSLFCAudienceFaction)
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
