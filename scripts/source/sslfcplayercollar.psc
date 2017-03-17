Scriptname sslfcplayercollar extends ReferenceAlias  

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if (akBaseObject == SSLFCCollar)
		Actor player = self.GetActorRef()
		player.EquipItem(SSLFCCollar)
	endif
EndEvent

Armor Property SSLFCCollar  Auto