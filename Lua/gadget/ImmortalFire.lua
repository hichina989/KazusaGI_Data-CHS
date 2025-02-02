function OnBeHurt(context, element_type, strike_type, is_host)
	if element_type == ElementType.Fire then
		ScriptLib.SetGadgetState(context, GadgetState.GearStart)
	end
end