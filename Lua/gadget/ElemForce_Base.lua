function OnClientExecuteReq(context, param1, param2, param3)
	if param1 == 1 then
		ScriptLib.SetGadgetState(context, GadgetState.GearStart)
	elseif param1 == 2 then
		ScriptLib.SetGadgetState(context, GadgetState.GearAction1)
	elseif param1 == 3 then
		ScriptLib.SetGadgetState(context, GadgetState.GearAction2)
	elseif param1 == 4 then
		ScriptLib.SetGadgetState(context, GadgetState.Action01)
	elseif param1 == 5 then
		ScriptLib.SetGadgetState(context, GadgetState.Action02)
	elseif param1 == 6 then
		ScriptLib.SetGadgetState(context, GadgetState.Action03)
	elseif param1 == 7 then
		ScriptLib.SetGadgetState(context, GadgetState.ChestBramble)
	end	
end


