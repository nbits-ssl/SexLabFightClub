Scriptname sslfc_util extends Quest  

Function Log(String msg)
	bool debugLogFlag = true
	; bool debugLogFlag = false

	if (debugLogFlag)
		debug.trace("[sslfc] " + msg);
	endif
EndFunction