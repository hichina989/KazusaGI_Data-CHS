-- Trigger变量
local defs = {
	max_gear = 3,
	timer = 4,
	group_id = 133102525,
	gadget_1 = 525001,
	gadget_2 = 525002,
	gadget_3 = 525003,
	gadget_4 = 0,
	gadget_chest = 525004
}


--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 525001, gadget_id = 70900049, pos = { x = 1122.0, y = 208.8, z = 954.2 }, rot = { x = 0.0, y = 330.8, z = 0.0 }, level = 19, persistent = true },
	{ config_id = 525002, gadget_id = 70900049, pos = { x = 1126.9, y = 208.7, z = 955.2 }, rot = { x = 0.0, y = 329.0, z = 0.0 }, level = 24, persistent = true },
	{ config_id = 525003, gadget_id = 70900049, pos = { x = 1123.9, y = 208.6, z = 959.2 }, rot = { x = 0.0, y = 59.1, z = 0.0 }, level = 24, persistent = true },
	{ config_id = 525004, gadget_id = 70211111, pos = { x = 1124.4, y = 207.9, z = 955.9 }, rot = { x = 0.0, y = 330.5, z = 0.0 }, level = 24, drop_tag = "解谜中级璃月", showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_525006", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_525006", action = "action_EVENT_GADGET_STATE_CHANGE_525006", trigger_count = 0 },
	{ name = "TIMER_EVENT_525007", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "condition_EVENT_TIMER_EVENT_525007", action = "action_EVENT_TIMER_EVENT_525007", trigger_count = 0 },
	{ name = "VARIABLE_CHANGE_525008", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_525008", action = "action_EVENT_VARIABLE_CHANGE_525008", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "active_count", value = 0, no_refresh = false }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	end_suite = 0,
	rand_suite = false
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 1,
		-- description = suite_1,
		monsters = { },
		gadgets = { 525001, 525002, 525003 },
		regions = { },
		triggers = { "GADGET_STATE_CHANGE_525006", "TIMER_EVENT_525007", "VARIABLE_CHANGE_525008" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_525006(context, evt)
	if defs.gadget_1 ~= evt.param2 and defs.gadget_2 ~= evt.param2 and defs.gadget_3 ~= evt.param2 and defs.gadget_4 ~= evt.param2 then
	return false
	end
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_525006(context, evt)
	if 0 == ScriptLib.GetGroupVariableValue(context, "active_count") then
	ScriptLib.MarkPlayerAction(context, 1001, 1, 1)
	end
	if evt.param1 == GadgetState.Default then
	ScriptLib.ChangeGroupVariableValue(context, "active_count", -1)
	elseif evt.param1 == GadgetState.GearStart then
	ScriptLib.ChangeGroupVariableValue(context, "active_count", 1)
	ScriptLib.CreateGroupTimerEvent(context, defs.group_id, tostring(evt.param2), defs.timer)
	else
	return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_525007(context, evt)
	if evt.source_name ~= tostring(defs.gadget_1) and evt.source_name ~= tostring(defs.gadget_2) and evt.source_name ~= tostring(defs.gadget_3) and evt.source_name ~= tostring(defs.gadget_4) then
	return false
	end
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_525007(context, evt)
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, tonumber(evt.source_name), GadgetState.Default) then
	return -1
	end 
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_525008(context, evt)
	if evt.param1 == -1 then
	ScriptLib.MarkPlayerAction(context, 1001, 4, 1)
	end
	if evt.param1 ~= defs.max_gear then
	return false
	end
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_525008(context, evt)
	ScriptLib.CancelGroupTimerEvent(context, defs.group_id, tostring(defs.gadget_1))
	ScriptLib.CancelGroupTimerEvent(context, defs.group_id, tostring(defs.gadget_2))
	ScriptLib.CancelGroupTimerEvent(context, defs.group_id, tostring(defs.gadget_3))
	ScriptLib.CancelGroupTimerEvent(context, defs.group_id, tostring(defs.gadget_4))
	if ScriptLib.CreateGadget(context, { config_id = defs.gadget_chest }) ~= 0 then
	return -1
	end
	ScriptLib.MarkPlayerAction(context, 1001, 3, 1)
	return 0
end
